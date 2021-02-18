from django.shortcuts import render
from django.urls import reverse
from django.utils.timezone import datetime
from activities_calendar.calendars import CalendarScore

from datetime import date
import pytz


def score_activities_monthly(request, start=None, end=None):
    student = request.user.student
    if start:
        start = datetime.strptime(start, '%d-%m-%Y')
        start = datetime(start.year, start.month, start.day, 0, 0, tzinfo=pytz.UTC)
    if end:
        end = datetime.strptime(end, '%d-%m-%Y')
        end = datetime(end.year, end.month, end.day, 0, 0, tzinfo=pytz.UTC)
    calendar = CalendarScore(activities=student.all_score_activities, type="monthly", start_date=start, end_date=end)
    context = calendar.to_dict()
    context.update({
        'today': date.today(),
        'title': "Ispitne aktivnosti",
        'url_monthly': reverse('activities_calendar:score-monthly'),
        'url_weekly': reverse('activities_calendar:score-weekly'),
    })
    return render(request, 'activities_calendar/calendar_monthly.html', context)


def score_activities_weekly(request, start=None, end=None):
    student = request.user.student
    if start:
        start = datetime.strptime(start, '%d-%m-%Y')
        start = datetime(start.year, start.month, start.day, 0, 0, tzinfo=pytz.UTC)
    if end:
        end = datetime.strptime(end, '%d-%m-%Y')
        end = datetime(end.year, end.month, end.day, 0, 0, tzinfo=pytz.UTC)
    calendar = CalendarScore(activities=student.all_score_activities, type="weekly", start_date=start, end_date=end)
    context = calendar.to_dict()
    context.update({
        'today': date.today(),
        'title': "Ispitne aktivnosti",
        'url_monthly': reverse('activities_calendar:score-monthly'),
        'url_weekly': reverse('activities_calendar:score-weekly'),
    })
    return render(request, 'activities_calendar/calendar_weekly.html', context)