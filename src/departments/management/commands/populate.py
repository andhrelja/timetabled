from django.core.management.base import BaseCommand
from django.conf import settings
from departments.models import (
    University,
    Department,
    Program
)
import json

class Command(BaseCommand):
    help = 'Populates Universities, Departments and Programs for the `departments` app'

    def handle(self, *args, **options):
        self.populate_universities()
        self.populate_departments()
    
    def read_json(self, filename):
        json_path = settings.BASE_DIR / 'static' / 'data' / filename
        with open(json_path, 'r', encoding='utf8') as json_file:
            return json.load(json_file)
    
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
        