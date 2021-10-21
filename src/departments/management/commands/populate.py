from itertools import accumulate
from django.core.management.base import BaseCommand
from django.conf import settings
from datetime import datetime, date
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

# Find type - Django choice
find_type = lambda value, choices: [item for item in choices if value == item[1]]

TYPE_NAMES = {
    # Class
    'p+v'   : 'Predavanja i vježbe',
    'p'     : 'Predavanja',
    'v'     : 'Vježbe',

    # Score
    'z'     : 'Završni ispit',
    'dz'    : 'Domaća zadaća',
    'k'     : 'Kolokvij',
    's'     : 'Seminar',
    'prez'  : 'Prezentacija',
    'lz'    : 'Laboratorijske vježbe',
    'sa'    : 'Samoprovjera',
    
    'pr'    : 'Projekt',
    'tr'    : 'Grupni rad',
    'r'     : 'Rasprava',
    'kv'    : 'Kviz',
    'a'     : 'Aktivnost',
    'pa'    : 'Popravna aktivnost',
    ''      : 'Ostalo',
}

TYPE_SWITCH = {
    # Class
    'p+v'    : find_type('Predavanja i vježbe', CLASS_TYPE_CHOICES)[0],
    'p'     : find_type('Predavanja', CLASS_TYPE_CHOICES)[0],
    'v'     : find_type('Vježbe', CLASS_TYPE_CHOICES)[0],

    # Score
    'z'     : find_type('Završni ispit', SCORE_TYPE_CHOICES)[0],
    'dz'    : find_type('Domaća zadaća', SCORE_TYPE_CHOICES)[0],
    'k'     : find_type('Kolokvij',      SCORE_TYPE_CHOICES)[0],
    's'     : find_type('Seminar',       SCORE_TYPE_CHOICES)[0],
    'prez'  : find_type('Prezentacija',  SCORE_TYPE_CHOICES)[0],
    'lz'    : find_type('Laboratorijske vježbe', SCORE_TYPE_CHOICES)[0],
    
    'pr'    : find_type('Projekt',      SCORE_TYPE_CHOICES)[0],
    'tr'    : find_type('Grupni rad',   SCORE_TYPE_CHOICES)[0],
    'r'     : find_type('Rasprava',     SCORE_TYPE_CHOICES)[0],
    'kv'    : find_type('Kviz',         SCORE_TYPE_CHOICES)[0],
    'a'     : find_type('Aktivnost',    SCORE_TYPE_CHOICES)[0],
    'pa'    : find_type('Popravna aktivnost', SCORE_TYPE_CHOICES)[0],
    ''      : find_type('Ostalo',       SCORE_TYPE_CHOICES)[0],
}

VALIDATE_ACTIVITIES = {
    'name'       : lambda name         : name,
    'location'   : lambda location     : location,
    'details'    : lambda details      : details.strip(),
    'subject'    : lambda subject      : subject,
    'group'      : lambda group        : group,
    'active'     : lambda active       : active,
    'due_date'   : lambda datum        : datetime.strptime(datum, '%d.%m.%Y.') if datum != '' else datetime(1, 1, 1, 0, 0),
    'start_time' : lambda time_string  : time_string.split('-')[0].strip(),
    'end_time'   : lambda time_string  : time_string.split('-')[1].strip(),
    'type'       : lambda type_key, choice : find_type(TYPE_NAMES[type_key], choice)[0],
    'points_total' : lambda points_total   : float(points_total) if points_total != '' else 0,
}



class Command(BaseCommand):
    help = 'Populates Universities, Departments and Programs for the `departments` app'

    def handle(self, *args, **options):
        #self.populate_universities()
        #self.populate_departments()

        #self.populate_subjects()
        self.populate_activities(13)
        #self.bind_subjects_students(username='andhrelja')
    
    def read_json(self, filename):
        json_path = settings.BASE_DIR / 'static' / 'data' / filename
        with open(json_path, 'r', encoding='utf8') as json_file:
            return json.load(json_file)
    
    def read_csv(self, filename):
        if filename:
            csv_path = settings.BASE_DIR / 'static' / 'data' / filename
            if csv_path.is_file():
                csv_file = open(csv_path, 'r', encoding='utf-8-sig')
                if '2022' in filename:
                    return csv.DictReader(csv_file, delimiter=',')
                else:
                    return csv.DictReader(csv_file, delimiter='|')
            else:
                with open('missing.txt', 'a') as f:
                    f.write(str(csv_path))
                #raise FileNotFoundError(csv_path)


    def populate_universities(self):
        dictionary_list = self.read_json('universities.json')
        
        for dictionary in dictionary_list:
            obj, created = University.objects.get_or_create(**dictionary)
            if created:
                self.stdout.write(self.style.SUCCESS('[SUCCESS] University Created "{}"'.format(obj.code)))
            else:
                self.stdout.write(self.style.SUCCESS('[INFO] University "{}" already existed'.format(obj.code)))
            

    def populate_departments(self):
        dictionary_list = self.read_json('departments.json')
        
        for dictionary in dictionary_list:
            programs = dictionary.pop('programs')
            id = dictionary.pop('id')
            obj, created = Department.objects.get_or_create(id=id, defaults=dictionary)
            if created:
                self.stdout.write(self.style.SUCCESS('[SUCCESS] Department Created "{}"'.format(obj.code)))
            else:
                self.stdout.write(self.style.SUCCESS('[INFO] Department "{}" already existed'.format(obj.code)))
            
            self.populate_programs(programs, obj.id)
        

    def populate_programs(self, programs, department_id):
        for dictionary in programs:
            program_id = dictionary.pop('id')
            dictionary.update({
                'department_id': department_id
            })
            obj, created = Program.objects.get_or_create(
                id=program_id, defaults=dictionary)
            if created:
                self.stdout.write(self.style.SUCCESS('[SUCCESS] Program Created "{}"'.format(obj.name)))
            else:
                self.stdout.write(self.style.SUCCESS('[INFO] Program "{}" already existed'.format(obj.name)))
    

    def populate_subjects(self):
        dictionary_list = self.read_json('subjects.json')
        
        for dictionary in dictionary_list:
            subject_id  = dictionary.pop('id')
            program_id  = dictionary.pop('program_id')

            program     = Program.objects.get(id=program_id)
            optional    = dictionary.pop('optional')
            semester    = dictionary.pop('semester')
            academic_year = dictionary.pop('academic_year')
            assistant = ", ".join(dictionary.pop('assistant'))

            description = dictionary.pop('description')
            csv_file = dictionary.pop('csv_file')

            additional_keys = ('predavanja_dan', 'predavanja_vrijeme', 'predavanja_trajanje', 
                             'vjezbe_dan', 'vjezbe_vrijeme', 'vjezbe_trajanje')
            if all((
                True if key in dictionary.keys() else False
                for key in additional_keys
            )):
                predavanja_dan = dictionary.pop('predavanja_dan')
                predavanja_vrijeme = dictionary.pop('predavanja_vrijeme')
                predavanja_trajanje = dictionary.pop('predavanja_trajanje')
                vjezbe_dan = dictionary.pop('vjezbe_dan')
                vjezbe_vrijeme = dictionary.pop('vjezbe_vrijeme')
                vjezbe_trajanje = dictionary.pop('vjezbe_trajanje')

            subject, created = Subject.objects.get_or_create(id=subject_id, defaults=dictionary)

            if created:
                self.stdout.write(self.style.SUCCESS('[CREATE] Subject Created "{}"'.format(subject)))
            else:
                subject.assistant = assistant
                subject.description = description
                subject.csv_file = csv_file
                subject.predavanja_dan = predavanja_dan
                subject.predavanja_vrijeme = predavanja_vrijeme
                subject.predavanja_trajanje = predavanja_trajanje
                subject.vjezbe_dan = vjezbe_dan
                subject.vjezbe_vrijeme = vjezbe_vrijeme
                subject.vjezbe_trajanje = vjezbe_trajanje
                subject.save()
                self.stdout.write(self.style.SUCCESS('[UPDATE] Subject "{}" already existed'.format(subject.code)))
            
            sp, _ = SubjectPrograms.objects.get_or_create(subject=subject, program=program)
            self.stdout.write(self.style.SUCCESS('[INFO] Setting up SubjectPrograms for subject={}, program={}'.format(program, subject)))
            sp.optional = optional
            sp.semester = semester
            sp.academic_year = academic_year
            sp.save()
                


    def populate_activities(self, _program_id=None):
        if not _program_id:
            subjects = Subject.objects.all()
        else:
            subject_ids = SubjectPrograms.objects.filter(program_id=_program_id, semester='3', active=True).values_list('subject_id')
            subjects = Subject.objects.filter(id__in=subject_ids)
        
        for subject in subjects:
            if not subject.csv_file or ('/15/' in subject.csv_file or '404.csv' in subject.csv_file):
                continue

            dictionary_list = self.read_csv(subject.csv_file)
        
            if dictionary_list:
                for dictionary in dictionary_list:
                    type_key = dictionary['Nastava'].lower()

                    if type_key not in TYPE_NAMES.keys():
                        raise ValueError("Unknown activity type:", type_key)
                    
                    stage_dictionary = {
                        'name'       : TYPE_NAMES[type_key],
                        'location'   : dictionary['Prostor'],
                        'type'       : type_key,
                        'details'    : dictionary['Tema'],
                        'subject'    : subject,
                        'active'     : True,
                        'due_date'   : dictionary['Datum'],
                        'points_total' : dictionary['Bodovi']
                    }

                    if 'Grupa' in dictionary.keys():
                        stage_dictionary.update({
                            'group': dictionary['Grupa']
                        })

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
                        """
                        start_time = '00:00'
                        end_time = '23:59'
                        """
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
                                final_dictionary['type'] = VALIDATE_ACTIVITIES[key](value, SCORE_TYPE_CHOICES)[0]
                            else:
                                final_dictionary[key] = VALIDATE_ACTIVITIES[key](value)
                        elif type_key in ('p', 'v', 'p+v') and dictionary['Vrijeme'] != '':
                            if key == 'type':
                                final_dictionary['type'] = VALIDATE_ACTIVITIES[key](value, CLASS_TYPE_CHOICES)[0]
                            else:
                                final_dictionary[key] = VALIDATE_ACTIVITIES[key](value)
                        elif type_key not in ('p', 'v', 'p+v') and dictionary['Vrijeme'] == '':
                            if key == 'start_time':
                                final_dictionary['start_time'] = value
                            elif key == 'end_time':
                                final_dictionary['end_time'] = value
                            elif key == 'type':
                                final_dictionary['type'] = VALIDATE_ACTIVITIES[key](value, SCORE_TYPE_CHOICES)[0]
                            else:
                                final_dictionary[key] = VALIDATE_ACTIVITIES[key](value)
                        elif type_key in ('p', 'v', 'p+v') and dictionary['Vrijeme'] == '':
                            if key == 'start_time':
                                final_dictionary['start_time'] = value
                            elif key == 'end_time':
                                final_dictionary['end_time'] = value
                            elif key == 'type':
                                final_dictionary['type'] = VALIDATE_ACTIVITIES[key](value, CLASS_TYPE_CHOICES)[0]
                            else:
                                final_dictionary[key] = VALIDATE_ACTIVITIES[key](value)

                    if type_key in ('p', 'v', 'p+v'):
                        final_dictionary.pop('points_total')
                        GlobalClassActivity.objects.get_or_create(**final_dictionary)
                        self.stdout.write(self.style.SUCCESS('[SUCCESS][{}] (Class): Created Activity "{}"'.format(subject, final_dictionary['name'])))
                    else:
                        GlobalScoreActivity.objects.get_or_create(**final_dictionary)
                        self.stdout.write(self.style.SUCCESS('[SUCCESS][{}] (Score): Created Activity "{}"'.format(subject, final_dictionary['name'])))

        
    def bind_subjects_students(self, username=None):
        if username:
            students = Student.objects.filter(user__username=username)
        else:
            students = Student.objects.all()
        
        for student in students:
            # deactivate old SubjectPrograms
            for sp in SubjectPrograms.objects.filter(program=student.program, semester=student.get_active_semester()):
                if sp.academic_year != student.get_active_academic_year():
                    sp.active = False
                    sp.save()
            subject_ids = SubjectPrograms.objects.filter(program=student.program, semester=student.get_active_semester(), optional=False).values_list('subject_id')

            for subject in Subject.objects.filter(id__in=subject_ids):
                ss, created = StudentSubjects.objects.get_or_create(subject=subject, student=student, academic_year=student.get_active_academic_year())
                ss.semester = student.get_active_semester()
                ss.ingest_points(subject, student)

                if created:
                    self.stdout.write(self.style.SUCCESS('[SUCCESS][CREATE] (Bind) Student: {} - Subject: "{}"'.format(student, subject.name)))
                else:
                    self.stdout.write(self.style.SUCCESS('[SUCCESS][EXISTS] (Bind) Student: {} - Subject: "{}"'.format(student, subject.name)))
                