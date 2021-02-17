from django.shortcuts import render
from django.utils import timezone

from dashboard import pies, bars
from accounts.views import set_session
from activities_calendar.calendars import CalendarScore
from activities_calendar.utils import (
    get_first_dayofcurrentweek,
    get_last_dayofcurrentweek
)



def index(request):
    if request.user.is_authenticated:
        set_session(request, request.user.student)
        context = get_dashboard_context(request.user.student)
        return render(request, 'dashboard.html', context)
    else:
        return render(request, 'index.html')


def get_dashboard_context(student):
    subjects = student.subjects
    score_activities = student.all_score_activities
    class_activities = student.all_class_activities

    calendar = CalendarScore(
        activities=score_activities + class_activities, 
        type="monthly", 
        start_date=get_first_dayofcurrentweek(), 
        end_date=get_last_dayofcurrentweek()
    )

    context = calendar.to_dict()

    # TODO: Confidence intervals
    context.update({
        'today': timezone.now(),
        'student': student,
        'subjects': subjects,
        'score_activities': score_activities,
        'class_activities': class_activities,
        'upcoming_score_activities': len(student.upcoming_score_activities(days=None)),
        'upcoming_class_activities': len(student.upcoming_class_activities(days=None)),

        'critical_subjects': student.get_critical_subjects(),

        #Bars
        'subjects_gpa_bar': bars.get_subject_gpa(student),
        
        # Treemaps
        'subjects_activities_pie': pies.get_subjects_activities(student),

        # Pies
        'score_activity_pie': pies.get_score_activities(student.all_score_activities),
        'class_activity_pie': pies.get_class_activities(student.all_class_activities),
    })

    return context

