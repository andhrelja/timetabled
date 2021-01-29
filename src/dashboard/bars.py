from django.db.models import Count

import pygal
from .styles import (
    style_score_activities_bar,
    style_class_activities_bar
)


def get_subject_gpa(student):
    subjects = student.subjects.annotate(Count('globalscoreactivity'))
    subjects = subjects.order_by('-globalscoreactivity__count')

    bar_chart = pygal.Bar(range=(0, 5, 0.5), style=style_score_activities_bar, height=401, legend_at_bottom=True)
    bar_chart.x_labels = [subject.name for subject in subjects]
    
    
    temp_gpa, total_gpa = list(), list()
    for subject in subjects:
        temp, _ = subject.gpa_student(student)
        temp_gpa.append(temp)

    for subject in subjects:
        _, total = subject.gpa_student(student)
        total_gpa.append(total)

    bar_chart.add("Trenutni prosjek", temp_gpa)
    bar_chart.add("Ukupni prosjek", total_gpa)
    
    return bar_chart.render_data_uri()