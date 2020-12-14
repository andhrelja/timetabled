from django import template
from datetime import datetime, timedelta
from dateutil.relativedelta import relativedelta


register = template.Library()

@register.filter
def add_days(start_date, days):
    delta = start_date + timedelta(days=days)
    return datetime.strftime(delta, "%d-%m-%Y")

@register.filter
def add_months(start_date, months):
    delta = start_date + relativedelta(months=months)
    return datetime.strftime(delta, "%d-%m-%Y")