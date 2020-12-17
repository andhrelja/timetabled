# from django.utils import timezone
from datetime import datetime, date, timedelta
from .models import DateTime

# Create your models here.

class EmptyCalendar(dict):

    types = ("monthly", "weekly", "daily")

    def __init__(self, type='monthly', start_date=None):        
        if not start_date:
            self.start_date = datetime.now()
        else:
            if isinstance(start_date, str):
                self.start_date = datetime.strptime(start_date, "%d-%m-%Y")
            elif isinstance(start_date, date) or isinstance(start_date, datetime):
                self.start_date = start_date
        
        self.type = self.validate_type(type)

        self.start_date = self.date_start
        self.end_date = self.date_end
        self.header = self.get_header()
        self.table = self.get_table()

        self['start_date'] = self.start_date
        self['end_date'] = self.end_date
        self['header'] = self.header
        self['table'] = self.table

    def validate_type(self, type_name):
        if type_name in self.types:
            return type_name
        raise ValueError('"{}" is not a valid type_name'.format(type_name))

    @property
    def date_start(self):
        _date = DateTime(self.start_date)
        start_date = {
            'monthly': _date.monthly_start_date(),
            'weekly' : _date.weekly_start_date(),
            'daily'  : _date,
        }
        return start_date[self.type]


    @property
    def date_end(self):
        _date = DateTime(self.start_date)
        start_date = {
            'monthly': _date.monthly_end_date(),
            'weekly' : _date.weekly_end_date(),
            'daily'  : _date,
        }
        return start_date[self.type]
    
    def get_header(self):
        if self.type == 'weekly':
            return ('Ponedjeljak', 'Utorak', 'Srijeda', 'Četvrtak', 'Petak')
        elif self.type == 'monthly':
            return ('Ponedjeljak', 'Utorak', 'Srijeda', 'Četvrtak', 'Petak', 'Subota', 'Nedjelja')
        elif self.type == 'daily':
            _date = DateTime(self.start_date)
            return ('', _date.day_name())
        else:
            return self.validate_type(self.type)
    
    def get_table(self):
        types = {
            'monthly': self.get_monthly_table,
            'weekly' : self.get_weekly_table,
            'daily'  : self.get_daily_table,
        }
        return types[self.type]()

    

    def get_monthly_table(self):
        table = list()
        current_month = self.start_date.month
        
        curr_date = self.start_date
        while curr_date.month == current_month:
            week = list()
            for i in range(7):
                if curr_date.weekday() == i:
                    week.append([curr_date])
                    curr_date += timedelta(days=1)
                else:
                    week.append([None])
                
            table.append(week)
        return table

    def get_weekly_table(self):
        hours = list()
        _datetime = self.start_date.replace(hour=8, minute=0)
        
        for i in range(32):
            if i % 2 == 0:
                kwargs = {'hours': int(i / 2), 'minutes': 0}
            else:
                kwargs = {'hours': int(i / 2), 'minutes': 30}

            table_week = list()
            for j in range(0, 5):
                curr_date = _datetime + timedelta(days=j, **kwargs)
                if curr_date.weekday() == j:
                    table_week.append([curr_date])
                else:
                    table_week.append([None])
            
            week = [[_datetime + timedelta(**kwargs)]] + table_week
            hours.append(week)
        return hours


    def get_daily_table(self):
        hours = list()
        _datetime = self.start_date.replace(hour=8, minute=0)
        
        for i in range(32):
            if i % 2 == 0:
                kwargs = {'hours': int(i / 2), 'minutes': 0}
            else:
                kwargs = {'hours': int(i / 2), 'minutes': 30}
            
            dt = [_datetime + timedelta(**kwargs), None]
            hours.append(dt)
        return hours

    def to_dict(self):
        return self.__dict__


class Calendar(EmptyCalendar):
    #full_table = []

    def __init__(self, activities, **kwargs):
        super(Calendar, self).__init__(**kwargs)
        self.activities = activities
        self.full_table = list()
        self.get_full_table()
        self['full_table'] = self.full_table
    

    def limit_activities(self):
        activities = list()
        for activity in self.activities:
            if activity.due_date >= self.start_date.date() and activity.due_date <= self.end_date.date():
                activities.append(activity)
        self.activities = activities
    
    def get_full_table(self):
        self.limit_activities()
        types = {
            'monthly': self.fill_monthly_table,
            'weekly' : self.fill_weekly_table,
            'daily'  : self.fill_daily_table,
        }
        return types[self.type]()
    
    def fill_monthly_table(self):
        for table_week in self.table:
            for i, _date in enumerate(table_week):
                if _date[0] is not None:
                    for activity in self.activities:
                        if _date[0].date() == activity.due_date:
                            table_week[i].append(activity)
            self.full_table.append(table_week)

    def fill_weekly_table(self):
        for table_week in self.table:
            for i, _date in enumerate(table_week[1:]):
                if _date[0] is not None:
                    for activity in self.activities:
                        if not activity in table_week[i+1] and _date[0].date() == activity.due_date and \
                            (activity.start_time >= _date[0].time() and activity.end_time <= _date[0].time() \
                                or activity.start_time <= _date[0].time() and activity.end_time >= _date[0].time()) :
                            table_week[i+1].append(activity)
            self.full_table.append(table_week)

    def fill_daily_table(self):
        for dt in self.table:
            for activity in self.activities:
                if dt[0].date() == activity.due_date:
                    self.full_table.append(activity)

    def to_dict(self):
        return self.__dict__




class CalendarScore(Calendar):
    type = "monthly"

class CalendarClass(Calendar):
    type = "weekly"



if __name__ == '__main__':
    from subjects.models import Subject

    for subject in Subject.objects.all():
        score_activities = subject.all_score_activities()
        score_calendar = Calendar(score_activities, type='monthly')
        break

def timetable(student, date):
    start_date = week_start(date)
    end_date = week_end(date)
    delta = end_date - start_date

    empty_table = table_hours()
    header = ('', 'Ponedjeljak', 'Utorak', 'Srijeda', 'Četvrtak', 'Petak')
    table = {hour: [] for hour in empty_table}

    for i in range(delta.days + 1):
        curr_date = week_start + timedelta(days=i)

        profile_schedules = ProfileSchedule.objects.filter(
            profile=profile, date=curr_date.date())
        schedules = SubjectSchedule.objects.filter(
            Q(subject__in=profile.subjects.filter(
                semester=request.session.get('semester'),
                academic_year=request.session.get('academic_year'))),
                date=curr_date.date()
        ).exclude(id__in=profile_schedules.filter(schedule__isnull=False).values_list('schedule_id'))

        for hour in table_hours:
            schedule = schedules.filter(
                start_time__lte=hour, end_time__gt=hour)
            profile_schedule = profile_schedules.filter(
                start_time__lte=hour, end_time__gt=hour)
            if profile_schedule.exists():
                table[hour].append(profile_schedule)
            elif not profile_schedule.exists() and schedule.exists():
                table[hour].append(schedule)
            elif not profile_schedule.exists() and not schedule.exists():
                table[hour].append((0, curr_date.strftime('%Y-%m-%d')))

    return {
        'date': week_start.strftime('%Y%m%d'),
        'week_start': week_start.strftime('%d/%m/%Y'),
        'week_end': week_end.strftime('%d/%m/%Y'),
        'header': header,
        'table': table
    }
