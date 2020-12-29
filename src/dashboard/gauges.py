import pygal
from .styles import style_number_gauge

def get_student_gauge(student):
    gauge = pygal.SolidGauge(inner_radius=0.70, style=style_number_gauge)
    percent_formatter = lambda x: '{:.10g}%'.format(x)
    gauge.value_formatter = percent_formatter

    completed_score = student.all_score_activities_completed_count()
    total_score = len(student.all_score_activities)

    completed_class = student.all_class_activities_completed_count()
    total_class = len(student.all_class_activities)

    remaining_semester = student.get_remaining_semester_days()
    total_semeter = student.get_total_semester_days()


    gauge.add('Bodovne aktivnosti', [{
        'value': student.all_score_activities_completed_count(), 
        'max_value': len(student.all_score_activities)
    }])
    gauge.add('Nastavne aktivnosti', [{
        'value': student.all_class_activities_completed_count(), 
        'max_value': len(student.all_class_activities)
    }])
    gauge.add('Preostalo dana u semestru', [{
        'value': student.get_remaining_semester_days(), 
        'max_value': student.get_total_semester_days()
    }])
    
    return gauge.render_data_uri()