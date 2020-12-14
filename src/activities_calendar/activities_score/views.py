from django.shortcuts import render, redirect
from activities_calendar.calendars import CalendarScore


def score_activities_monthly(request, start=None):
    student = request.user.student
    calendar = CalendarScore(activities=student.all_score_activities, type="monthly", start_date=start)
    return render(request, 'activities_calendar/calendar_monthly.html', calendar.to_dict())