from django.core.management.base import BaseCommand
from django.conf import settings
from datetime import datetime
import json
import csv

from activities_class.constraints import TYPE_CHOICES as CLASS_TYPE_CHOICES
from activities_class.activities_global.models import GlobalClassActivity
from activities_score.constraints import TYPE_CHOICES as SCORE_TYPE_CHOICES
from activities_score.activities_global.models import GlobalScoreActivity

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
    'start_time' : lambda time_string  : time_string.split('-')[0].strip() if time_string != '' else '10:15',
    'end_time'   : lambda time_string  : time_string.split('-')[1].strip() if time_string != '' else '11:45',
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
    ''     : lambda choice: find_type('Ostalo', choice)[0],
}

class Command(BaseCommand):
    help = 'Populates Universities, Departments and Programs for the `departments` app'

    def handle(self, *args, **options):
        self.populate_universities()
        self.populate_departments()

        self.populate_subjects()
        self.populate_activities()
    
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
                self.stdout.write(self.style.SUCCESS('Successfully created university "{}"'.format(obj.code)))
            else:
                self.stdout.write(self.style.SUCCESS('University "{}" already existed'.format(obj.code)))
            

    def populate_departments(self):
        dictionary_list = self.read_json('departments.json')
        
        for dictionary in dictionary_list:
            programs = dictionary.pop('programs')
            obj, created = Department.objects.get_or_create(**dictionary)
            if created:
                self.stdout.write(self.style.SUCCESS('Successfully created department "{}"'.format(obj.code)))
            else:
                self.stdout.write(self.style.SUCCESS('Department "{}" already existed'.format(obj.code)))
            
            self.populate_programs(programs, obj.id)
        

    def populate_programs(self, programs, department_id):
        for dictionary in programs:
            obj, created = Program.objects.get_or_create(
                department_id=department_id, **dictionary)
            if created:
                self.stdout.write(self.style.SUCCESS('Successfully created program "{}"'.format(obj.name)))
            else:
                self.stdout.write(self.style.SUCCESS('Program "{}" already existed'.format(obj.name)))
    

    def populate_subjects(self):
        dictionary_list = self.read_json('subjects.json')
        
        for dictionary in dictionary_list:
            subject_id  = dictionary.pop('id')
            optional    = dictionary.pop('optional')
            program_id  = dictionary.pop('program_id')
            program     = Program.objects.get(id=program_id)
            subject, created = Subject.objects.get_or_create(id=subject_id, defaults=dictionary)

            if created:
                self.stdout.write(self.style.SUCCESS('Successfully created subject "{}"'.format(subject.code)))
            else:
                self.stdout.write(self.style.SUCCESS('Subject "{}" already existed'.format(subject.code)))
            
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
                    'start_time' : dictionary['Vrijeme'],
                    'end_time'   : dictionary['Vrijeme'],
                    'points_total' : dictionary['Bodovi']
                }

                final_dictionary = dict()
                for key, value in stage_dictionary.items():
                    if key == 'type':
                        final_dictionary[key] = VALIDATE_ACTIVITIES[key](value, choice)
                    else:
                        final_dictionary[key] = VALIDATE_ACTIVITIES[key](value)

                if type_key in ('p', 'v', 'p+v'):
                    final_dictionary.pop('points_total')
                    GlobalClassActivity.objects.get_or_create(**final_dictionary)
                    self.stdout.write(self.style.SUCCESS('[SUCCESS] (Nebodana): "{}" kolegija "{}" uspješno stvorena'.format(final_dictionary['name'], subject.name)))
                else:
                    GlobalScoreActivity.objects.get_or_create(**final_dictionary)
                    self.stdout.write(self.style.SUCCESS('[SUCCESS] (Bodovana): "{}" kolegija "{}" uspješno stvorena'.format(final_dictionary['name'], subject.name)))
                