from django.core.management.base import BaseCommand
from django.conf import settings
import json

from subjects.models import Subject


class Command(BaseCommand):
    help = 'Integrates scraped data into data to populate'

    def handle(self, *args, **options):
        scraped_subjects = self.read_json('scraped')
        final_subjects = self.read_json('final')

        self.handle_scrapes(scraped_subjects, final_subjects)
    
    def read_json(self, trigger):
        if trigger == 'scraped':
            json_path = settings.BASE_DIR / 'subjects_scraped.json'
        elif trigger == 'final':
            json_path = settings.BASE_DIR / 'static' / 'data' / 'subjects.json'
        with open(json_path, 'r', encoding='utf8') as json_file:
            return json.load(json_file)
    
    def handle_scrapes(self, scraped_subjects, final_subjects):
        for subject in final_subjects:
            scraped_subject = self.subject_scraped(subject['name'], scraped_subjects)
            if scraped_subject:
                subject = Subject.objects.get(name=subject['name'])
                subject.csv_file       = scraped_subject['csv_file']
                subject.dinp_link      = scraped_subject['dinp']
                
                try:
                    subject.predavanja_dan = scraped_subject['predavanja_dan']
                    subject.vjezbe_dan     = scraped_subject['vjezbe_dan']
                    subject.predavanja_vrijeme = scraped_subject['predavanja_vrijeme']
                    subject.vjezbe_vrijeme     = scraped_subject['vjezbe_vrijeme']
                    subject.vjezbe_trajanje    = scraped_subject['vjezbe_trajanje']
                except KeyError:
                    pass
                
                subject.save()

                for sp in subject.subjectprograms_set.filter(active=True):
                    sp.academic_year = 2020
                    sp.save()

    def subject_scraped(self, name, scraped_subjects):
        for subject in scraped_subjects:
            if subject['naziv'] == name:
                return subject
        return None