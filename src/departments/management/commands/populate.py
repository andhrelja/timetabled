from django.core.management.base import BaseCommand
from django.conf import settings
from datetime import datetime, timedelta, date
import json
import csv

from activities_class.constraints import TYPE_CHOICES as CLASS_TYPE_CHOICES
from activities_class.activities_global.models import GlobalClassActivity
from activities_score.constraints import TYPE_CHOICES as SCORE_TYPE_CHOICES
from activities_score.activities_global.models import GlobalScoreActivity

from accounts.models import Student, StudentSubjects
from subjects.models import Subject, SubjectPrograms
from departments.models import (
    University,
    Department,
    Program
)

find_type = lambda value, choices: [item for item in choices if value == item[1]]

VALIDATE_ACTIVITIES = {
    'name'       : lambda name         : name,
    'location'   : lambda location     : location,
    'details'    : lambda details      : details.strip(),
    'subject'    : lambda subject      : subject,
    'due_date'   : lambda datum        : datetime.strptime(datum, '%d.%m.%Y.'),
    'start_time' : lambda time_string  : time_string.split('-')[0].strip(),
    'end_time'   : lambda time_string  : time_string.split('-')[1].strip(),
    'type'       : lambda type_key, choice : TYPE_SWITCH[type_key](choice)[0],
    'points_total' : lambda points_total   : float(points_total) if points_total != '' else 0,
}

TYPE_SWITCH = {
    # Class
    'p'     : lambda choice: find_type('Predavanja', choice)[0],
    'v'     : lambda choice: find_type('Vježbe', choice)[0],
    'p+v'   : lambda choice: find_type('Predavanja i vježbe', choice)[0],
    # Score
    'k'     : lambda choice: find_type('Kolokvij', choice)[0],
    's'     : lambda choice: find_type('Seminar', choice)[0],
    'e'     : lambda choice: find_type('Esej', choice)[0],
    'prez'  : lambda choice: find_type('Prezentacija', choice)[0],
    'dz'    : lambda choice: find_type('Domaća zadaća', choice)[0],
    'lz'    : lambda choice: find_type('Laboratorijske vježbe', choice)[0],
    'z'     : lambda choice: find_type('Završni ispit', choice)[0],
    'pr'    : lambda choice: find_type('Projekt', choice)[0],
    'tr'    : lambda choice: find_type('Timski rad', choice)[0],
    'r'     : lambda choice: find_type('Rasprava', choice)[0],
    'kv'    : lambda choice: find_type('Kviz', choice)[0],
    ''      : lambda choice: find_type('Ostalo', choice)[0],
}


class Command(BaseCommand):
    help = 'Populates Universities, Departments and Programs for the `departments` app'

    def handle(self, *args, **options):
        self.populate_universities()
        self.populate_departments()

        self.populate_subjects()
        self.populate_activities()
        self.bind_subjects_students()
    
    def read_json(self, filename):
        json_path = settings.BASE_DIR / 'static' / 'data' / filename
        with open(json_path, 'r', encoding='utf8') as json_file:
            return json.load(json_file)
    
    def read_csv(self, filename):
        csv_path = settings.BASE_DIR / 'static' / 'data' / filename
        if csv_path.is_file():
            csv_file = open(csv_path, 'r', encoding='utf8')
            return csv.DictReader(csv_file, delimiter='|')
        else:
            return []
    
    def populate_universities(self):
        dictionary_list = self.read_json('universities.json')
        
        for dictionary in dictionary_list:
            obj, created = University.objects.get_or_create(**dictionary)
            if created:
                self.stdout.write(self.style.SUCCESS('[SUCCESS] University Created "{}"'.format(obj.code)))
            else:
                self.stdout.write(self.style.SUCCESS('[NOTICE] University "{}" already existed'.format(obj.code)))
            

    def populate_departments(self):
        dictionary_list = self.read_json('departments.json')
        
        for dictionary in dictionary_list:
            programs = dictionary.pop('programs')
            obj, created = Department.objects.get_or_create(**dictionary)
            if created:
                self.stdout.write(self.style.SUCCESS('[SUCCESS] Department Created "{}"'.format(obj.code)))
            else:
                self.stdout.write(self.style.SUCCESS('[NOTICE] Department "{}" already existed'.format(obj.code)))
            
            self.populate_programs(programs, obj.id)
        

    def populate_programs(self, programs, department_id):
        for dictionary in programs:
            obj, created = Program.objects.get_or_create(
                department_id=department_id, **dictionary)
            if created:
                self.stdout.write(self.style.SUCCESS('[SUCCESS] Program Created "{}"'.format(obj.name)))
            else:
                self.stdout.write(self.style.SUCCESS('[NOTICE] Program "{}" already existed'.format(obj.name)))
    

    def populate_subjects(self):
        dictionary_list = self.read_json('subjects.json')
        
        for dictionary in dictionary_list:
            subject_id  = dictionary.pop('id')
            optional    = dictionary.pop('optional')
            program_id  = dictionary.pop('program_id')
            program     = Program.objects.get(id=program_id)
            dictionary['assistant'] = ", ".join(dictionary['assistant'])
            subject, created = Subject.objects.get_or_create(id=subject_id, defaults=dictionary)

            if created:
                self.stdout.write(self.style.SUCCESS('[SUCCESS] Subject Created "{}"'.format(subject.code)))
            else:
                self.stdout.write(self.style.SUCCESS('[NOTICE] Subject "{}" already existed'.format(subject.code)))
            
            SubjectPrograms.objects.get_or_create(subject=subject, program=program, optional=optional)


    def populate_activities(self):
        for subject in Subject.objects.all():
            dictionary_list = self.read_csv(subject.csv_file)
            total_points_total = 0
            for dictionary in dictionary_list:
                type_key = dictionary['Nastava'].lower()

                if type_key in ('p', 'v', 'p+v'):
                    choice = CLASS_TYPE_CHOICES
                elif type_key in ('k', 's', 'e', 'prez', 'dz', 'lz', 'z', 'pr', 'tr', 'r', 'o', ''):
                    choice = SCORE_TYPE_CHOICES
                else:
                    choice = None
                    raise ValueError("Unknown activity type:", type_key)
                
                stage_dictionary = {
                    'name'       : "{} - {}".format(TYPE_SWITCH[type_key](choice)[1], dictionary['Prostor']),
                    'location'   : dictionary['Prostor'],
                    'type'       : type_key,
                    'details'    : dictionary['Tema'],
                    'subject'    : subject,
                    'due_date'   : dictionary['Datum'],
                    'points_total' : dictionary['Bodovi']
                }

                vrijeme_ukupno = dictionary['Vrijeme']
                if vrijeme_ukupno == '':
                    if type_key in ('p', 'p+v'):
                        start_time = subject.predavanja_vrijeme
                        tdelta = subject.predavanja_trajanje
                    elif type_key == 'v':
                        start_time = subject.vjezbe_vrijeme
                        tdelta = subject.vjezbe_trajanje
                    else:
                        start_time = subject.vjezbe_vrijeme
                        tdelta = subject.vjezbe_trajanje
                    end_time = datetime.combine(date(1, 1, 1), start_time) + tdelta

                    stage_dictionary.update({
                        'start_time' : start_time,
                        'end_time'   : end_time
                    })
                else:
                    stage_dictionary.update({
                        'start_time' : dictionary['Vrijeme'],
                        'end_time'   : dictionary['Vrijeme']
                    })



                final_dictionary = dict()
                for key, value in stage_dictionary.items():
                    if type_key not in ('p', 'v', 'p+v') and dictionary['Vrijeme'] != '':
                        if key == 'type':
                            final_dictionary['type'] = VALIDATE_ACTIVITIES[key](value, choice)
                        else:
                            final_dictionary[key] = VALIDATE_ACTIVITIES[key](value)
                    else:
                        if key == 'start_time':
                            final_dictionary['start_time'] = value
                        elif key == 'end_time':
                            final_dictionary['end_time'] = value
                        elif key == 'type':
                            final_dictionary['type'] = VALIDATE_ACTIVITIES[key](value, choice)
                        else:
                            final_dictionary[key] = VALIDATE_ACTIVITIES[key](value)

                if type_key in ('p', 'v', 'p+v'):
                    final_dictionary.pop('points_total')
                    GlobalClassActivity.objects.get_or_create(**final_dictionary)
                    self.stdout.write(self.style.SUCCESS('[SUCCESS] (Nastavna): "{}" kolegija "{}" uspješno stvorena'.format(final_dictionary['name'], subject.name)))
                else:
                    GlobalScoreActivity.objects.get_or_create(**final_dictionary)
                    self.stdout.write(self.style.SUCCESS('[SUCCESS] (Bodovna): "{}" kolegija "{}" uspješno stvorena'.format(final_dictionary['name'], subject.name)))
        
        
    def bind_subjects_students(self):
        for student in Student.objects.all():
            subject_ids = SubjectPrograms.objects.filter(program=student.program, optional=False).values_list('subject_id')

            for subject in Subject.objects.filter(id__in=subject_ids):
                ss, _ = StudentSubjects.objects.get_or_create(subject=subject, student=student, academic_year=2020)
                ss.ingest_points(subject, student)
                self.stdout.write(self.style.SUCCESS('[SUCCESS] (Bind) Student: "{}" - Subject: {}" uspješno stvorena'.format(student, subject.name)))