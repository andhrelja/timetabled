from django.db import models
from django.urls import reverse

from subjects.models import Subject, ACADEMIC_YEAR_CHOICES
from datetime import date, datetime

# Create your models here.
class Student(models.Model):
    STUDY_YEAR_CHOICES = ((i, i) for i in range(1, 4))

    user            = models.OneToOneField("auth.User", verbose_name="Django korisnik", on_delete=models.CASCADE)
    
    studying_year   = models.IntegerField("Godina studija", choices=STUDY_YEAR_CHOICES)
    program         = models.ForeignKey("departments.Program", verbose_name="Program", on_delete=models.CASCADE)

    class Meta:
        verbose_name = "Student"
        verbose_name_plural = "Studenti"


    @property
    def subjects(self):
        subject_ids = set()
        for ss in self.studentsubjects_set.filter():
            subject_ids.add(ss.subject.id)
        return Subject.objects.filter(id__in=subject_ids, semester=self.get_active_semester())
    
    @property
    def gpa(self):
        sum_total, sum_accomplished = 0, 0
        for activity in self.all_score_activities:
            sum_total += activity.points_total
            sum_accomplished += activity.points_accomplished
        return sum_accomplished * (5 / sum_total)
    

    @property
    def all_score_activities(self):
        activities = list()
        for subject in self.subjects:
            subject_score_activities = subject.all_score_activities(self)
            activities += list(subject_score_activities)
        return sorted(activities, key=lambda instance: instance.due_date)
    
    @property
    def all_class_activities(self):
        activities = list()
        for subject in self.subjects:
            subject_class_activities = subject.all_class_activities(self)
            activities += list(subject_class_activities)
        return sorted(activities, key=lambda instance: instance.due_date)

    def subject_score_activities(self, subject):
        subject_score_activities = subject.all_score_activities(self)
        return sorted(subject_score_activities, key=lambda instance: instance.due_date)
    
    def subject_class_activities(self, subject):
        subject_class_activities = subject.all_class_activities(self)
        return sorted(subject_class_activities, key=lambda instance: instance.due_date)

    def all_score_activities_completed_count(self):
        completed_count = 0
        all_score_activities = self.all_score_activities
        for score_activity in all_score_activities:
            if score_activity.completed or score_activity.points_accomplished != 0:
                completed_count += 1
        return completed_count
        
    def all_class_activities_completed_count(self):
        completed_count = 0
        all_class_activities = self.all_class_activities
        for class_activity in all_class_activities:
            if class_activity.due_date < date.today():
                completed_count += 1
        return completed_count


    def subject_score_activities_completed_count(self, subject):
        completed_count = 0
        subject_score_activities = self.subject_score_activities(subject)
        for score_activity in subject_score_activities:
            if score_activity.completed or score_activity.points_accomplished != 0:
                completed_count += 1
        return completed_count
        
    def subject_class_activities_completed_count(self, subject):
        completed_count = 0
        subject_class_activities = self.subject_class_activities(subject)
        for class_activity in subject_class_activities:
            if class_activity.due_date < date.today():
                completed_count += 1
        return completed_count


    def upcoming_score_activities(self, days=7):
        if days is None:
            days = self.get_remaining_semester_days()
        activities = list()
        for subject in self.subjects:
            subject_score_activities = subject.upcoming_score_activities(self, days)
            activities += list(subject_score_activities)
        return sorted(activities, key=lambda instance: instance.due_date)

    def past_score_activities(self):
        activities = list()
        for subject in self.subjects:
            subject_score_activities = subject.past_score_activities(self)
            activities += list(subject_score_activities)
        return sorted(activities, key=lambda instance: instance.due_date)

    def upcoming_class_activities(self, days=7):
        if days is None:
            days = self.get_remaining_semester_days()
        activities = list()
        for subject in self.subjects:
            subject_class_activities = subject.upcoming_class_activities(self, days)
            activities += list(subject_class_activities)
        return sorted(activities, key=lambda instance: instance.due_date)
    
    def get_active_semester(self):
        today = date.today()

        if today.month > 9:
            if self.studying_year == 1:
                semester = "1"
            elif self.studying_year == 2:
                semester = "3"
            elif self.studying_year == 3:
                semester = "5"
            else:
                semester = None
        else:
            if self.studying_year == 1:
                semester = "2"
            elif self.studying_year == 2:
                semester = "5"
            elif self.studying_year == 3:
                semester = "6"
            else:
                semester = None

        return semester
    
    def get_active_academic_year(self):
        today = date.today()

        if today.month > 9:
            year = today.year
        else:
            year = today.year - 1
        return "{}/{}".format(year, year+1)

    def get_remaining_semester_days(self):
        today = date.today()

        if today.month > 9:
            year = today.year
            end_date = datetime(year + 1, 2, 28, 0, 0)
        else:
            year = today.year
            end_date = datetime(year, 9, 30, 0, 0)
        tdelta = end_date - datetime.now()
        return tdelta.days


    def __str__(self):
        return self.user.get_full_name()

    def get_absolute_url(self):
        return reverse("accounts:detail", kwargs={"pk": self.pk})


class StudentSubjects(models.Model):

    student = models.ForeignKey("accounts.Student", verbose_name="Student", on_delete=models.CASCADE)
    subject = models.ForeignKey("subjects.Subject", verbose_name="Kolegij", on_delete=models.CASCADE)
    academic_year = models.IntegerField("Akademska godina", choices=ACADEMIC_YEAR_CHOICES, default=2020)

    points_accomplished = models.FloatField("Osvojeni bodovi", default=0)
    points_total        = models.FloatField("Ukupno bodovi", default=0)

    def ingest_points(self, subject, student):
        total_points = subject.points_total(student)
        self.subject = subject
        self.student = student
        self.points_total = total_points
        self.save()

    class Meta:
        verbose_name = "Student - Kolegiji"
        verbose_name_plural = "Studenti - Kolegiji"
        unique_together = ['student', 'subject', 'academic_year']


    def get_absolute_url(self):
        return reverse("StudentSubjects_detail", kwargs={"pk": self.pk})
