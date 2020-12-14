from django.db import models
from django.urls import reverse
from itertools import chain

from subjects.models import Subject
from datetime import date

# Create your models here.
class Student(models.Model):
    STUDY_YEAR_CHOICES = ((i, i) for i in range(1, 4))

    user            = models.OneToOneField("auth.User", verbose_name="Django korisnik", on_delete=models.CASCADE)
    
    studying_year   = models.IntegerField("Godina studija", choices=STUDY_YEAR_CHOICES)
    program         = models.ForeignKey("departments.Program", verbose_name="Program", on_delete=models.CASCADE)
    # subjects        = models.ManyToManyField("subjects.Subject", verbose_name="Upisani kolegiji")
    
    @property
    def subjects(self):
        subject_ids = set()
        for ss in self.studentsubjects_set.all():
            subject_ids.add(ss.subject.id)
        return Subject.objects.filter(id__in=subject_ids)
    
    @property
    def all_score_activities(self):
        activities = list()
        for subject in self.subjects:
            subject_score_activities = subject.all_score_activities
            activities += list(subject_score_activities)
        return sorted(activities, key=lambda instance: instance.due_date)
    
    @property
    def all_class_activities(self):
        activities = list()
        for subject in self.subjects:
            subject_class_activities = subject.all_class_activities
            activities += list(subject_class_activities)
        return sorted(activities, key=lambda instance: instance.due_date)
    

    def upcoming_score_activities(self, days=7):
        activities = list()
        for subject in self.subjects:
            subject_score_activities = subject.upcoming_score_activities(days)
            activities += list(subject_score_activities)
        return sorted(activities, key=lambda instance: instance.due_date)

    def past_score_activities(self):
        activities = list()
        for subject in self.subjects:
            subject_score_activities = subject.past_score_activities()
            activities += list(subject_score_activities)
        return sorted(activities, key=lambda instance: instance.due_date)

    def upcoming_class_activities(self, days=7):
        activities = list()
        for subject in self.subjects:
            subject_class_activities = subject.upcoming_class_activities(days)
            activities += list(subject_class_activities)
        return sorted(activities, key=lambda instance: instance.due_date)
    
    class Meta:
        verbose_name = "Student"
        verbose_name_plural = "Studenti"

    def __str__(self):
        return self.user.get_full_name()

    def get_absolute_url(self):
        return reverse("accounts:detail", kwargs={"pk": self.pk})

class StudentSubjects(models.Model):

    student = models.ForeignKey("accounts.Student", verbose_name="Student", on_delete=models.CASCADE)
    subject = models.ForeignKey("subjects.Subject", verbose_name="Kolegij", on_delete=models.CASCADE)

    points_accomplished = models.FloatField("Osvojeni bodovi", default=0)
    points_total        = models.FloatField("Ukupno bodovi", default=0)

    def ingest_points(self):
        total_points = self.subject.points_total
        self.points_total = total_points
        self.save()

    class Meta:
        verbose_name = "Student - Kolegiji"
        verbose_name_plural = "Studenti - Kolegiji"


    def get_absolute_url(self):
        return reverse("StudentSubjects_detail", kwargs={"pk": self.pk})
