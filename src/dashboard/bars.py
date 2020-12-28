from django.db.models import Count

import pygal
from .styles import (
    style_score_activities_bar,
    style_class_activities_bar
)


def get_subject_gpa(student):
    bar_chart = pygal.Bar(range=(0, 5, 0.5), legend_at_bottom=True, style=style_score_activities_bar)
    subjects = student.subjects.annotate(Count('globalscoreactivity'))
    # bar_chart.x_labels = [subject.name for subject in subjects.order_by('-globalscoreactivity__count')]
    for subject in subjects.order_by('-globalscoreactivity__count'):
        bar_chart.add(subject.name, subject.gpa_student(student))
    return bar_chart.render_data_uri()