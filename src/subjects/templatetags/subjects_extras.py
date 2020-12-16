from django import template


register = template.Library()

@register.filter
def points_accomplished(subject, student):
    return subject.points_accomplished(student)

@register.filter
def points_total(subject, student):
    return subject.points_total(student)

@register.filter
def all_score_activities(subject, student):
    return subject.all_score_activities(student)

@register.filter
def all_class_activities(subject, student):
    return subject.all_class_activities(student)

@register.filter
def all_upcoming_score_activities(subject, student):
    return subject.all_upcoming_score_activities(student)

@register.filter
def all_upcoming_class_activities(subject, student):
    return subject.all_upcoming_class_activities(student)

@register.filter
def upcoming_score_activities(subject, student):
    return subject.upcoming_score_activities(student)

@register.filter
def past_score_activities(subject, student):
    return subject.past_score_activities(student)

@register.filter
def upcoming_class_activities(subject, student):
    return subject.upcoming_class_activities(student)

@register.filter
def past_class_activities(subject, student):
    return subject.past_class_activities(student)