from tempfile import NamedTemporaryFile
import shutil
import csv
import os

VALIDATE = {
    'kolok':    lambda tema: 'k' if 'kolok' in tema else None,
    'zada':     lambda tema: 'dz' if 'zada' in tema else None,
    'završni':  lambda tema: 'z' if 'završni' in tema else None,
    'esej':     lambda tema: 'e' if 'esej' in tema else None,
    'osvrt':    lambda tema: 'e' if 'osvrt' in tema else None,
    'seminar':  lambda tema: 's' if 'seminar' in tema else None,
    'analiz':   lambda tema: 's' if 'analiz' in tema else None,
    'projekt':  lambda tema: 'pr' if 'projekt' in tema else None,
    'prezent':  lambda tema: 'pr' if 'prezent' in tema else None,
    'rad':      lambda tema: 'pr' if 'rad' in tema else None,    
    'tim':      lambda tema: 'tr' if 'tim' in tema else None,
    'grup':     lambda tema: 'tr' if 'grup' in tema else None,
    'rasprav':  lambda tema: 'r' if 'rasprav' in tema else None,
    'diskus':   lambda tema: 'r' if 'diskus' in tema else None,
}

folder_name, _, file_names = list(os.walk('.'))[0]

for file_name in file_names:
    if file_name.endswith('.py'):
        break
    tmpfile = NamedTemporaryFile(mode='w', delete=False)
    with open(file_name, 'r') as csvfile, tmpfile:
        reader = csv.DictReader(csvfile, delimiter='|', fieldnames=['Datum','Vrijeme','Prostor','Tema','Nastava','Bodovi','Izvođač'])
        writer = csv.DictWriter(tmpfile, delimiter='|', fieldnames=['Datum','Vrijeme','Prostor','Tema','Nastava','Bodovi','Izvođač'])
        for row in reader:
            if row['Nastava'] == 'Z':
                types = set()
                for key, fn in VALIDATE.items():
                    types.add(fn(row['Tema']))
                row = {
                    'Datum': row['Datum'],
                    'Vrijeme': row['Vrijeme'],
                    'Prostor': row['Prostor'],
                    'Tema': row['Tema'],
                    'Nastava': types.pop() if types is not set(None) else 'o',
                    'Bodovi': row['Bodovi'],
                    'Izvođač': row['Izvođač'],
                }
            writer.writerow(row)
    shutil.move(tmpfile.name, file_name)
                




def kolokviji():
    kolokviji = []
    for tema in sorted(commons):
        if 'kolok' in tema.lower():
            kolokviji.append(tema)

    print("Kolokviji: ", len(kolokviji))

def zadace():
    zadace = []
    for tema in sorted(commons):
        if 'zada' in tema.lower():
            zadace.append(tema)

    print("Zadaće: ", len(zadace))

def Završni():
    Završni = []
    for tema in sorted(commons):
        if 'završni' in tema.lower():
            Završni.append(tema)

    print("Završni: ", len(Završni))

def seminari():
    seminari = []
    for tema in sorted(commons):
        if 'seminar' in tema.lower() or 'analiz' in tema.lower():
            seminari.append(tema)

    print("Seminari: ", len(seminari))

def eseji():
    eseji = []
    for tema in sorted(commons):
        if 'esej' in tema.lower() or 'osvrt' in tema.lower():
            eseji.append(tema)

    print("Eseji: ", len(eseji))

def projekti():
    projekti = []
    for tema in sorted(commons):
        if 'projekt' in tema.lower() or 'rad' in tema.lower():
            projekti.append(tema)

    print("Projekti: ", len(projekti))


def timski():
    timski = []
    for tema in sorted(commons):
        if 'tim' in tema.lower() or 'grup' in tema.lower():
            timski.append(tema)

    print("Timski: ", len(timski))

def prezentacije():
    prezentacije = []
    for tema in sorted(commons):
        if 'prezent' in tema.lower():
            prezentacije.append(tema)

    print("Prezentacije: ", len(prezentacije))


def rasprave():
    rasprave = []
    for tema in sorted(commons):
        if 'rasprav' in tema.lower() or 'diskus' in tema.lower():
            rasprave.append(tema)

    print("Rasprave: ", len(rasprave))


def ostalo():
    ostalo = []
    for tema in sorted(commons):
        bools = set()
        for item in ('kolok', 'zada', 'završni', 'esej', 'seminar', 'projekt', 'tim', 'grup', 'prezent', 'rasprav', 'diskus', 'osvrt', 'rad', 'analiz'):
            if item in tema.lower():
                bools.add(False)
            else:
                bools.add(True)
        if all(bools):
            ostalo.append(tema)
    
    print_ostalo(ostalo)
    print("Ostalo: ", len(ostalo))

def print_ostalo(ostalo):
    for o in sorted(ostalo):
        print(o)
