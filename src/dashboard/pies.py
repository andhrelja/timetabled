from django.db.models import Count

import pygal
from .styles import (
    style_score_activities_pie,
    style_class_activities_pie,
    style_class_activities_bar,
    style_semester_days_pie
)



def get_score_activities(activities_score, title=None):
    pie_chart = pygal.Pie(title=title, style=style_score_activities_pie)
    if title:
        pie_chart.inner_radius = 0.65

    predano, ne_predano = 0, 0
    for activity in activities_score:
        if activity.completed:
            predano += 1
        else:
            ne_predano += 1
    
    pie_chart.add('Predano', predano)
    pie_chart.add('Nije predano', ne_predano)
    return pie_chart.render_data_uri()

def get_class_activities(activities_class, title=None):
    pie_chart = pygal.Pie(title=title, style=style_class_activities_pie)
    if title:
        pie_chart.inner_radius = 0.65

    prisustva, ne_prisustva = 0, 0
    for activity in activities_class:
        if activity.attended:
            prisustva += 1
        else:
            ne_prisustva += 1
    
    pie_chart.add('Ostvarena prisustva', prisustva)
    pie_chart.add('Neostvarena prisustva', ne_prisustva)
    return pie_chart.render_data_uri()


def get_remaining_semester_days(student, title):
    pie_chart = pygal.Pie(title=title, style=style_semester_days_pie)
    pie_chart.inner_radius = 0.65

    total_days = student.get_total_semester_days()
    remaining_days = student.get_remaining_semester_days()

    pie_chart.add('Proteklo dana', total_days - remaining_days)
    pie_chart.add('Preostalo dana', remaining_days)
    return pie_chart.render_data_uri()

def get_subjects_activities(student):
    subjects = student.subjects.annotate(Count('globalscoreactivity'))
    subjects = subjects.order_by('-globalscoreactivity__count')

    pie_chart = pygal.Pie(style=style_class_activities_bar, legend_at_bottom=True)
    pie_chart.inner_radius = 0.65

    for subject in subjects:
        score_activities_count = len(subject.all_score_activities(student))
        class_activities_count = len(subject.all_class_activities(student))

        pie_chart.add(subject.name, score_activities_count + class_activities_count)
    return pie_chart.render_data_uri()