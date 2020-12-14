from django.shortcuts import render, redirect
from activities_calendar.calendars import EmptyCalendar


def class_activities_monthly(request):
    student = request.user.student
    empty_calendar = EmptyCalendar(type="monthly")
    return render(request, 'calendar_empty.html', empty_calendar.to_dict())