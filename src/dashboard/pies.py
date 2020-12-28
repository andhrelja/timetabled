import pygal
from .styles import (
    style_score_activities_pie,
    style_class_activities_pie
)


def get_score_activities(activities_score):
    pie_chart = pygal.Pie(style=style_score_activities_pie)

    predano, ne_predano = 0, 0
    for activity in activities_score:
        if activity.completed:
            predano += 1
        else:
            ne_predano += 1
    
    pie_chart.add('Predano', predano)
    pie_chart.add('Nije predano', ne_predano)
    return pie_chart.render_data_uri()

def get_class_activities(activities_class):
    pie_chart = pygal.Pie(style=style_class_activities_pie)

    prisustva, ne_prisustva = 0, 0
    for activity in activities_class:
        if activity.attended:
            prisustva += 1
        else:
            ne_prisustva += 1
    
    pie_chart.add('Ostvarena prisustva', prisustva)
    pie_chart.add('Neostvarena prisustva', ne_prisustva)
    return pie_chart.render_data_uri()    