from django.utils import timezone
import calendar


def get_first_dayofcurrentweek():
    now = timezone.now()
    new_day = now.day - now.weekday()
    try:
        start_date = now.replace(day=new_day)
    except ValueError: # Day is out of range
        last_day_of_prev_month = calendar.monthrange(now.year, now.month-1)[1]
        new_day = last_day_of_prev_month + new_day
        start_date = now.replace(day=new_day, month=now.month-1)
    return start_date

def get_last_dayofcurrentweek():
    now = timezone.now()
    new_day = now.day + (6 - now.weekday())
    try:
        end_date = now.replace(day=new_day)
    except ValueError: # Day is out of range
        last_day_of_month = calendar.monthrange(now.year, now.month)[1]
        new_day = new_day - last_day_of_month
        end_date = now.replace(day=new_day, month=now.month+1)
    return end_date