from django.db import models
from django.urls import reverse
from datetime import date, timedelta
from itertools import chain


ACADEMIC_YEAR_CHOICES = ((year, f"{year}/{year+1}") for year in range(date.today().year, 2018, -1))
SEMESTER_CHOICES = (
    ('1', "1. semester"),
    ('2', "2. semester"),
    ('3', "3. semester"),
    ('4', "4. semester"),
    ('5', "5. semester"),
    ('6', "6. semester"),
)


class Subject(models.Model):

    name            = models.CharField("Naziv", max_length=128)
    ects            = models.IntegerField("ECTS bodovi")
    professor       = models.CharField("Profesor", null=True, max_length=128)
    assistant       = models.CharField("Asistent", null=True, max_length=128)
    #completed       = models.BooleanField("Kolegij završen", default=False)
    academic_year   = models.IntegerField("Akademska godina", choices=ACADEMIC_YEAR_CHOICES)
    semester        = models.CharField("Semestar", choices=SEMESTER_CHOICES, max_length=1)
    code            = models.CharField("Kod", max_length=14)
    csv_file        = models.CharField("DINP - CSV datoteka", null=True, max_length=254)
    
    @property
    def points_accomplished(self):
        score_activities = self.activities_score()
        return sum((sa.points_accomplished for sa in score_activities))

    @property
    def points_total(self):
        score_activities = self.activities_score()
        return sum((sa.points_total for sa in score_activities))

    @property
    def all_score_activities(self):
        return self.activities_score()
    
    @property
    def all_class_activities(self):
        return self.activities_class()


    def all_upcoming_score_activities(self, days=365):
        return self.upcoming_score_activities(days)
    
    def all_upcoming_class_activities(self, days=365):
        return self.upcoming_class_activities(days)


    def upcoming_score_activities(self, days=7):
        today = date.today()
        score_activities = self.activities_score()
        for activity in score_activities:
            if activity.due_date >= today and activity.due_date <= today + timedelta(days=days):
                yield activity

    def past_score_activities(self):
        today = date.today()
        score_activities = self.activities_score()
        for activity in score_activities:
            if activity.due_date <= today:
                yield activity

    def upcoming_class_activities(self, days=7):
        today = date.today()
        class_activities = self.activities_class()
        for activity in class_activities:
            if activity.due_date >= today and activity.due_date <= today + timedelta(days=days):
                yield activity

    def past_class_activities(self):
        today = date.today()
        class_activities = self.activities_class()
        for activity in class_activities:
            if activity.due_date <= today:
                yield activity

    
    def activities_score(self):
        custom_activities = self.studentscoreactivity_set.filter(subject=self, global_activity_id__isnull=True, type=0) \
                        .only("id", "due_date", "name", "points_total", "points_accomplished")
        updated_global_activities = self.studentscoreactivity_set.filter(subject=self, global_activity_id__isnull=False) \
                        .only("id", "due_date", "name", "points_total", "points_accomplished")

        global_activities = self.globalscoreactivity_set.only("id", "due_date", "name", "points_total", "points_accomplished") \
                        .exclude(id__in=updated_global_activities.values_list('global_activity_id'))

        return sorted(chain(custom_activities, updated_global_activities, global_activities), key=lambda instance: instance.due_date, reverse=False)

    def activities_class(self):
        custom_activities = self.studentclassactivity_set.filter(subject=self, global_activity_id__isnull=True, type=0) \
                        .only("id", "due_date", "start_time", "end_time", "name")
        updated_global_activities = self.studentclassactivity_set.filter(subject=self, global_activity_id__isnull=False) \
                        .only("id", "due_date", "start_time", "end_time", "name")

        global_activities = self.globalclassactivity_set.only("id", "due_date", "start_time", "end_time", "name") \
                        .exclude(id__in=updated_global_activities.values_list('global_activity_id'))

        return sorted(chain(custom_activities, updated_global_activities, global_activities), key=lambda instance: (instance.due_date, instance.start_time), reverse=False)


    class Meta:
        verbose_name = "Kolegij"
        verbose_name_plural = "Kolegiji"

    def __str__(self):
        return self.name
    
    def get_absolute_url(self):
        return reverse('subjects:detail', kwargs={'pk': self.pk})


class SubjectPrograms(models.Model):

    subject  = models.ForeignKey("subjects.Subject", verbose_name="Kolegij", on_delete=models.CASCADE)
    program  = models.ForeignKey("departments.Program", verbose_name="Program", on_delete=models.CASCADE)
    optional = models.BooleanField("Izborni kolegij")

    class Meta:
        verbose_name = "Programi po kolegiju"
        verbose_name_plural = "Programi po kolegijima"

