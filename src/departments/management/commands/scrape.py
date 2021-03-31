from django.core.management.base import BaseCommand
from django.conf import settings

from bs4 import BeautifulSoup
import requests
import os
import json

class Command(BaseCommand):
    help = 'Scrapes INF UNIRI for DINP-s'

    def handle(self, *args, **options):
        diplomski_pi = 'https://www.inf.uniri.hr/izvedbeni-programi/diplomski-studij-poslovna-informatika'
        diplomski_iks = 'https://www.inf.uniri.hr/izvedbeni-programi/diplomski-studij-informacijski-i-komunikacijski-sustavi'
        diplomski_nastavnicki = 'https://www.inf.uniri.hr/izvedbeni-programi/diplomski-studij-nastavnicki'
        preddiplomski = 'https://www.inf.uniri.hr/izvedbeni-programi/preddiplomski-jednopredmetni'
        

        subjects = self.get_subjects('11', preddiplomski, write=True, download=True)

        print_str = ""
        for subject in subjects:
            print_str += "{{'name': {}}}".format(subject)

    def get_subjects(self, studij, link, write=False, download=False):
        response = requests.get(link)
        media_dir = settings.BASE_DIR / 'media'
        """
        with open(os.path.join(base_dir, media_dir, 'html', 'diplomski_pi.html'), 'r') as f:
            content = f.read()
        soup = BeautifulSoup(content, 'html.parser')
        """
        soup = BeautifulSoup(response.text, 'html.parser')
        subjects = []

        try:
            rows = soup.table.find_all('tr')
        except AttributeError:
            print("HTML document isn't valid - <table> missing")
        else:
            subjects = self.parse_rows(rows)
        
        if write:
            with open('subjects_scraped.json', 'w', encoding='utf-8') as f:
                json.dump(subjects, f, indent=4, ensure_ascii=False)
        if download:
            self.download_dinps(media_dir, studij, subjects)
        return subjects
    

    def parse_rows(self, rows, semesters=['2', '4', '6']):
        subjects = list()
        semestar = '1'
        izborni = False

        for row in rows:
            ths = row.find_all('th')

            if len(ths) == 1: # Dostupne informacije o semestru/izbornom kolegiju
                th = ths[0]
                if 'semestar' in th.text:
                    semestar = th.string
                    izborni = False
                elif 'izborni' in th.text.lower():
                    izborni = True

            if semestar[0] not in semesters:
                continue
            
            tds = row.find_all('td')

            if len(tds) == 3:
                naziv = tds[0].string
                nositelj = tds[1].string

                if tds[2].find('a'):
                    dinp = tds[2].a['href']
                else:
                    dinp = '/404'

                subject = {
                    'naziv': naziv,
                    'nositelj': nositelj,
                    'dinp': 'https://inf.uniri.hr' + dinp,
                    'semestar': semestar,
                    'izborni': izborni
                }
                subjects.append(subject)
        return subjects


    def download_dinps(self, media_dir, studij, subjects):
        for subject in subjects:
            filename = os.path.split(subject['dinp'])[1]
            response = requests.get(subject['dinp'])

            with open(os.path.join(media_dir, 'dinps', studij, filename), 'wb') as f:
                f.write(response.content)
    