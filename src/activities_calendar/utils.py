from django.utils import timezone


def get_first_dayofcurrentweek():
    now = timezone.now()
    start_date = now.replace(day=(now.day - now.weekday()))
    return start_date

def get_last_dayofcurrentweek():
    now = timezone.now()
    end_date = now.replace(day=(now.day + (6 - now.weekday())))
    return end_date