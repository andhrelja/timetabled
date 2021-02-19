from typing import Optional
from django.db import models
from django.urls import reverse
from datetime import date, timedelta
from itertools import chain


ACADEMIC_YEAR_CHOICES = ((year, f"{year}/{year+1}") for year in range(date.today().year, 2018, -1))
DAY_CHOICES = (
    ('ponedjeljkom', 'Ponedjeljak'),
    ('utorkom', 'Utorak'),
    ('srijedom', 'Srijeda'),
    ('četvrtkom', 'Četvrtak'),
    ('petkom', 'Petak'),
    ('subotom', 'Subota'),
    ('nedjeljom', 'Nedjelja'),
)


class SubjectPrograms(models.Model):
    SEMESTER_CHOICES = (
        ('1', "1. semester"),
        ('2', "2. semester"),
        ('3', "3. semester"),
        ('4', "4. semester"),
        ('5', "5. semester"),
        ('6', "6. semester"),
    )

    subject  = models.ForeignKey("subjects.Subject", verbose_name="Kolegij", on_delete=models.CASCADE)
    program  = models.ForeignKey("departments.Program", verbose_name="Program", on_delete=models.CASCADE)
    optional = models.BooleanField("Izborni kolegij")

    academic_year = models.IntegerField("Akademska godina", choices=ACADEMIC_YEAR_CHOICES, default=2020)
    semester      = models.CharField("Semestar", choices=SEMESTER_CHOICES, max_length=1, null=True)

    class Meta:
        verbose_name = "Programi po kolegiju"
        verbose_name_plural = "Programi po kolegijima"



class Subject(models.Model):

    name            = models.CharField("Naziv", max_length=128)
    code            = models.CharField("Kod", max_length=14)
    ects            = models.IntegerField("ECTS bodovi")

    professor       = models.CharField("Profesor", null=True, max_length=128)
    assistant       = models.CharField("Asistent", null=True, max_length=128)
    
    predavanja_dan      = models.CharField("Predavanja - dan u tjednu", choices=DAY_CHOICES, null=True, max_length=64)
    predavanja_vrijeme  = models.TimeField("Predavanja - vrijeme početka", auto_now=False, null=True, auto_now_add=False)
    predavanja_trajanje = models.DurationField("Predavanja - trajanje", default="1:30")

    vjezbe_dan          = models.CharField("Vježbe - dan u tjednu", choices=DAY_CHOICES, null=True, max_length=64)
    vjezbe_vrijeme      = models.TimeField("Vježbe - vrijeme početka", auto_now=False, null=True, auto_now_add=False)
    vjezbe_trajanje     = models.DurationField("Vježbe - trajanje", default="1:30")

    dinp_link       = models.CharField("DINP - Download link", null=True, max_length=254)
    csv_file        = models.CharField("DINP - CSV datoteka", null=True, max_length=254)
    
    class Meta:
        verbose_name = "Kolegij"
        verbose_name_plural = "Kolegiji"
        ordering = ('code',)
    
    
    def __str__(self):
        return self.name
    
    def get_absolute_url(self):
        return reverse('subjects:detail', kwargs={'pk': self.pk})
    

    @property
    def optional(self):
        optional = list()
        for sp in self.subjectprograms_set.all():
            optional.append(sp.optional)
        return all(optional)
    
    def is_critical(self, student):
        accomplished_score_activities_points = self.points_accomplished(student)
        total_class_activities_count = self.all_class_activities_count(student)
        completed_class_activities_count = self.all_class_activities_completed_count(student)

        if completed_class_activities_count * 2 < total_class_activities_count:
            return False
        elif accomplished_score_activities_points > 35:
            return False
        
        return True


    def has_empty_activities(self, student):
        for activity in self.all_score_activities(student):
            if activity.due_date.year == 1:
                return True
        return False


    def gpa_student(self, student):
        sum_total, sum_accomplished_total, sum_accomplished = 0, 0, 0
        for activity in self.all_score_activities(student):
            sum_total += activity.points_total
            if activity.completed:
                sum_accomplished_total += activity.points_total
                sum_accomplished += activity.points_accomplished
            
        sum_total = 1 if sum_total == 0 else sum_total
        sum_accomplished_total = 1 if sum_accomplished_total == 0 else sum_accomplished_total

        gpa_accomplished = sum_accomplished * (5 / sum_accomplished_total)
        gpa_total = sum_accomplished * (5 / sum_total)
        return round(gpa_accomplished, 2), round(gpa_total, 2)


    def points_percentage(self, student):
        points_accomplished = self.points_accomplished(student)
        points_total = self.points_total(student)
        return points_accomplished / points_total

    def points_accomplished(self, student):
        score_activities = self.activities_score(student)
        return sum((sa.points_accomplished for sa in score_activities))

    def points_total(self, student):
        score_activities = self.activities_score(student)
        return sum((sa.points_total for sa in score_activities))


    def all_score_activities(self, student):
        return self.activities_score(student)
    
    def all_class_activities(self, student):
        return self.activities_class(student)
    
    def all_score_activities_count(self, student):
        return len(self.activities_score(student))
    
    def all_class_activities_count(self, student):
        return len(self.activities_class(student))

    
    def all_score_activities_completed_count(self, student):
        completed_count = 0
        all_score_activities = self.activities_score(student)
        for score_activity in all_score_activities:
            if score_activity.completed or score_activity.points_accomplished != 0:
                completed_count += 1
        return completed_count
        
    def all_class_activities_completed_count(self, student):
        completed_count = 0
        all_class_activities = self.activities_class(student)
        for class_activity in all_class_activities:
            if class_activity.due_date < date.today():
                completed_count += 1
        return completed_count



    def all_upcoming_score_activities(self, student, days=365):
        return self.upcoming_score_activities(student, days)
    
    def all_upcoming_class_activities(self, student, days=365):
        return self.upcoming_class_activities(student, days)


    def upcoming_score_activities(self, student, days=7):
        today = date.today()
        score_activities = self.activities_score(student)
        for activity in score_activities:
            if activity.due_date >= today and activity.due_date <= today + timedelta(days=days):
                yield activity


    def upcoming_class_activities(self, student, days=7):
        today = date.today()
        class_activities = self.activities_class(student)
        for activity in class_activities:
            if activity.due_date >= today and activity.due_date <= today + timedelta(days=days):
                yield activity

    def past_score_activities(self, student):
        today = date.today()
        score_activities = self.activities_score(student)
        for activity in score_activities:
            if activity.due_date <= today:
                yield activity
    
    def past_class_activities(self, student):
        today = date.today()
        class_activities = self.activities_class(student)
        for activity in class_activities:
            if activity.due_date <= today:
                yield activity

    
    def activities_score(self, student):
        custom_activities = self.studentscoreactivity_set.filter(student=student, global_activity_id__isnull=True) \
                        .only("id", "due_date", "name", "points_total", "points_accomplished")
        updated_global_activities = self.studentscoreactivity_set.filter(student=student, global_activity_id__isnull=False) \
                        .only("id", "due_date", "name", "points_total", "points_accomplished")

        global_activities = self.globalscoreactivity_set.only("id", "due_date", "name", "points_total", "points_accomplished") \
                        .exclude(models.Q(id__in=updated_global_activities.values_list('global_activity_id'))) #  | models.Q(points_total=0)

        return sorted(chain(custom_activities, updated_global_activities, global_activities), key=lambda instance: instance.due_date, reverse=False)

    def activities_class(self, student):
        custom_activities = self.studentclassactivity_set.filter(student=student, global_activity_id__isnull=True) \
                        .only("id", "due_date", "start_time", "end_time", "name")
        updated_global_activities = self.studentclassactivity_set.filter(student=student, global_activity_id__isnull=False) \
                        .only("id", "due_date", "start_time", "end_time", "name")

        global_activities = self.globalclassactivity_set.only("id", "due_date", "start_time", "end_time", "name") \
                        .exclude(id__in=updated_global_activities.values_list('global_activity_id'))

        return sorted(chain(custom_activities, updated_global_activities, global_activities), key=lambda instance: (instance.due_date, instance.start_time), reverse=False)
