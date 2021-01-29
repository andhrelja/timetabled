from django.shortcuts import render
from django.urls import reverse
from activities_calendar.calendars import CalendarScore

from datetime import date


def score_activities_monthly(request, start=None):
    student = request.user.student
    calendar = CalendarScore(activities=student.all_score_activities, type="monthly", start_date=start)
    context = calendar.to_dict()
    context.update({
        'today': date.today(),
        'title': "Ispitne aktivnosti",
        'url_monthly': reverse('activities_calendar:score-monthly'),
        'url_weekly': reverse('activities_calendar:score-weekly'),
    })
    return render(request, 'activities_calendar/calendar_monthly.html', context)


def score_activities_weekly(request, start=None):
    student = request.user.student
    calendar = CalendarScore(activities=student.all_score_activities, type="weekly", start_date=start)
    context = calendar.to_dict()
    context.update({
        'today': date.today(),
        'title': "Ispitne aktivnosti",
        'url_monthly': reverse('activities_calendar:score-monthly'),
        'url_weekly': reverse('activities_calendar:score-weekly'),
    })
    return render(request, 'activities_calendar/calendar_weekly.html', context)