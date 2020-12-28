from django.db.models import Count
from .styles import style_score_activities_bar
import pygal

def get_subjects_activities(student):
    bar_chart = pygal.Treemap(legend_at_bottom=True, style=style_score_activities_bar)
    subjects = student.subjects.annotate(Count('globalscoreactivity'))
    # bar_chart.x_labels = [subject.name for subject in subjects.order_by('-globalscoreactivity__count')]
    for subject in subjects.order_by('-globalscoreactivity__count'):
        bar_chart.add(subject.name, subject.globalscoreactivity__count)
    return bar_chart.render_data_uri()