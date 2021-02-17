from datetime import date, datetime, timedelta


class DateTime:

    def __init__(self, _date=None):
        if not _date:
            _date = date.today()
        if isinstance(_date, date):
            self._date = _date
        else:
            raise TypeError('Type "{}" is not a valid date type'.format(type(_date)))
    
    @classmethod
    def datetime(cls, _date=None):
        if _date is None:
            _date = cls._date
        return datetime(_date.year, _date.month,_date.day, 0, 0)
    
    @property
    def date(self):
        return date(self._date)

    def monthly_start_date(self):
        year  = self._date.year
        month = self._date.month
        day   = 1

        _date = date(year, month, day)
        return self.datetime(_date)

    def monthly_end_date(self):
        year  = self._date.year
        if self._date.month + 1 == 13:
            month = 1
            year += 1
        else:
            month = self._date.month + 1
        day   = 1
        _date = date(year, month, day)
        return self.datetime(_date) - timedelta(days=1)

    def weekly_start_date(self):
        _date = self._date - timedelta(days=self._date.weekday())
        return self.datetime(_date)

    def weekly_end_date(self):
        _date = self._date + timedelta(days=4)
        return self.datetime(_date)

    def day_name(self):
        weekday = self._date.weekday()
        day_names = {
            0: 'Ponedjeljak',
            1: 'Utorak',
            2: 'Srijeda',
            3: 'Četvrtak',
            4: 'Petak',
            5: 'Subota',
            6: 'Nedjelja',
        }
        return day_names[weekday]

