from django.shortcuts import render
from activities_calendar.calendars import CalendarClass

from datetime import date


def class_activities_weekly(request, start=None):
    student = request.user.student
    calendar = CalendarClass(activities=student.all_class_activities, type="weekly", start_date=start)
    context = calendar.to_dict()
    context.update({
        'today': date.today()
    })
    return render(request, 'activities_calendar/calendar_weekly.html', context)


def class_activities_monthly(request, start=None):
    student = request.user.student
    calendar = CalendarClass(activities=student.all_class_activities, type="monthly", start_date=start)
    context = calendar.to_dict()
    context.update({
        'today': date.today()
    })
    return render(request, 'activities_calendar/calendar_monthly.html', context)