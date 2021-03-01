import json
from datetime import timedelta


scraped_jpinf_11 = 'C:\\Users\\andhr\\Documents\\Django\\timetabled\\src\\static\\data\\dinps\\inf\\11\\subjects.json'
scraped_piinf_13 = 'C:\\Users\\andhr\\Documents\\Django\\timetabled\\src\\static\\data\\dinps\\inf\\13\\subjects.json'
scraped_ixinf_14 = 'C:\\Users\\andhr\\Documents\\Django\\timetabled\\src\\static\\data\\dinps\\inf\\14\\subjects.json'
scraped_nainf_15 = 'C:\\Users\\andhr\\Documents\\Django\\timetabled\\src\\static\\data\\dinps\\inf\\15\\subjects.json'

stable_subjects = 'C:\\Users\\andhr\\Documents\\Django\\timetabled\\src\\static\\data\\subjects1.json'

with open(stable_subjects, 'r', encoding='utf-8') as json_file:
    SUBJECTS = json.load(json_file)

subject_names = [subject['name'] for subject in SUBJECTS]

def get_i(name):
    for i, subject in enumerate(SUBJECTS):
        if subject['name'] == name:
            return i
        
def get_vjezbe_trajanje(trajanje_string, pauza_izmedju_grupa=30):
    time_string, multiplier = trajanje_string.split("*")
    hours, minutes = time_string.split(":")
    hours, minutes, multiplier = int(hours), int(minutes), int(multiplier)
    tdelta = timedelta(hours=hours, minutes=minutes)
    tdelta *= multiplier
    tdelta += timedelta(minutes=(pauza_izmedju_grupa * (multiplier - 1)))
    return str(tdelta)

def get_trajanje(trajanje_string):
    hours, minutes = trajanje_string.split(":")
    hours, minutes = int(hours), int(minutes)
    tdelta = timedelta(hours=hours, minutes=minutes)
    return str(tdelta)


scraped = [
    scraped_jpinf_11, 
    scraped_piinf_13, 
    scraped_ixinf_14, 
    scraped_nainf_15
]

for scrape in scraped:
    with open(scrape, 'r', encoding='utf-8') as json_file:
        scraped_subjects = json.load(json_file)
        for scraped_subject in scraped_subjects:
            if scraped_subject["naziv"] in subject_names: 
                i = get_i(scraped_subject["naziv"])

                if (scraped_subject['vjezbe_dan'] and scraped_subject['vjezbe_trajanje']) \
                    and "*" in scraped_subject['vjezbe_dan'] or "*" in scraped_subject['vjezbe_trajanje']:
                    vjezbe_dan = scraped_subject['vjezbe_dan'].split("*")[0]
                    vjezbe_vrijeme = scraped_subject['vjezbe_vrijeme']
                    try:
                        vjezbe_trajanje = get_vjezbe_trajanje(scraped_subject['vjezbe_trajanje'])
                    except Exception as e:
                        print(e)
                else:
                    vjezbe_dan = scraped_subject['vjezbe_dan']
                    vjezbe_vrijeme = scraped_subject['vjezbe_vrijeme']
                    vjezbe_trajanje = get_trajanje(scraped_subject['vjezbe_trajanje'])
                predavanja_trajanje = get_trajanje(scraped_subject['predavanja_trajanje'])
                
                if (scraped_subject['vjezbe_dan'] and scraped_subject['vjezbe_trajanje']) \
                    and "/" in scraped_subject['vjezbe_dan']:
                    print("TODO: '/' to divide activity dates")

                SUBJECTS[i].update({
                    'dinp_link': scraped_subject['dinp'],
                    'predavanja_dan': scraped_subject['predavanja_dan'],
                    'predavanja_vrijeme': scraped_subject['predavanja_vrijeme'],
                    'predavanja_trajanje': predavanja_trajanje,
                    'vjezbe_dan': vjezbe_dan,
                    'vjezbe_vrijeme': vjezbe_vrijeme,
                    'vjezbe_trajanje': vjezbe_trajanje
                })





out = 'C:\\Users\\andhr\\Documents\\Django\\timetabled\\src\\static\\data\\subjects2.json'
with open(out, 'w', encoding='utf-8') as f:
    json.dump(SUBJECTS, f, ensure_ascii=False)