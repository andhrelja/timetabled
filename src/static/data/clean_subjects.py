import json

with open('subjects.json', 'r', encoding='utf8') as json_file:
    content = json.load(json_file)

new_subjects = list()
processed_subjects = list()

find_subject_id = lambda code: [subject['id'] for subject in new_subjects if subject['code'] == code]

id = 0

for subject in content:
    subject.pop('id')
    if subject['code'] in processed_subjects:
        subject['id'] = find_subject_id(subject['code'])[0]
        new_subjects.append(subject)
    else:
        id += 1
        subject['id'] = id
        processed_subjects.append(subject['code'])
        new_subjects.append(subject)

with open('subjects1.json', 'w', encoding='utf8') as f:
    json.dump(new_subjects, f, ensure_ascii=False, indent=4)