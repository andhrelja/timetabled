from django.core.management.base import BaseCommand
from django.conf import settings
from departments.models import (
    University,
    Department,
    Program
)

class Command(BaseCommand):
    help = 'Populates Universities, Departments and Programs for the `departments` app'

    def handle(self, *args, **options):
        self.populate_universities()
        self.populate_departments()
        

    def populate_universities(self):
        pass

    def populate_departments(self):
        self.populate_programs()
        pass

    def populate_programs(self):
        pass