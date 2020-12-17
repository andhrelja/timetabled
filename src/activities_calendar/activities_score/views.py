from django.shortcuts import render
from activities_calendar.calendars import CalendarScore

from datetime import date


def score_activities_monthly(request, start=None):
    student = request.user.student
    calendar = CalendarScore(activities=student.all_score_activities, type="monthly", start_date=start)
    context = calendar.to_dict()
    context.update({
        'today': date.today()
    })
    return render(request, 'activities_calendar/calendar_monthly.html', context)