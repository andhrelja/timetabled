from django.db import models
from django.urls import reverse
from django.utils import timezone

from subjects.models import Subject, ACADEMIC_YEAR_CHOICES, SubjectPrograms

from datetime import datetime, date
import pytz



class StudentSubjects(models.Model):
    SEMESTER_CHOICES = (
        ('1', "1. semester"),
        ('2', "2. semester"),
        ('3', "3. semester"),
        ('4', "4. semester"),
        ('5', "5. semester"),
        ('6', "6. semester"),
    )

    student       = models.ForeignKey("accounts.Student", verbose_name="Student", on_delete=models.CASCADE)
    subject       = models.ForeignKey("subjects.Subject", verbose_name="Kolegij", on_delete=models.CASCADE)
    academic_year = models.IntegerField("Akademska godina", choices=ACADEMIC_YEAR_CHOICES, default=2020)
    semester      = models.CharField("Semestar", choices=SEMESTER_CHOICES, max_length=1, null=True)

    points_accomplished = models.FloatField("Osvojeni bodovi", default=0)
    points_total        = models.FloatField("Ukupno bodovi", default=0)

    class Meta:
        verbose_name = "Student - Kolegiji"
        verbose_name_plural = "Studenti - Kolegiji"
        unique_together = ['student', 'subject', 'academic_year']

    def ingest_points(self, subject, student):
        self.subject = subject
        self.student = student
        self.accomplished_points = subject.points_accomplished(student)
        self.points_total = subject.points_total(student)
        self.save()

    def get_absolute_url(self):
        return reverse("StudentSubjects_detail", kwargs={"pk": self.pk})


class Student(models.Model):
    STUDY_YEAR_CHOICES = ((i, i) for i in range(1, 4))

    user            = models.OneToOneField("auth.User", verbose_name="Django korisnik", on_delete=models.CASCADE)
    
    studying_year   = models.IntegerField("Godina studija", choices=STUDY_YEAR_CHOICES)
    program         = models.ForeignKey("departments.Program", verbose_name="Program", on_delete=models.CASCADE)

    class Meta:
        verbose_name = "Student"
        verbose_name_plural = "Studenti"
    
    def __str__(self):
        return self.user.get_full_name()

    def get_absolute_url(self):
        return reverse("accounts:detail", kwargs={"pk": self.pk})


    def bind_subjects(self):
        sps = SubjectPrograms.objects.filter(program=self.program, optional=False)
        for obj in sps.distinct():
            ss = StudentSubjects()
            ss.ingest_points(subject=obj.subject, student=self)

    @property
    def subjects(self):
        subject_ids = set()
        for ss in self.studentsubjects_set.filter(academic_year=self.get_active_academic_year(), semester=self.get_active_semester()):
            subject_ids.add(ss.subject.id)
        return Subject.objects.filter(id__in=subject_ids)
    
    @property
    def gpa(self):
        sum_total, sum_accomplished = 0, 0
        for activity in self.all_score_activities:
            if activity.completed:
                sum_total += activity.points_total
                sum_accomplished += activity.points_accomplished
        sum_total = 1 if sum_total == 0 else sum_total
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

    def get_critical_subjects(self):
        critical_subjects = list()
        for subject in self.subjects:
            if subject.is_critical(student=self):
                critical_subjects.append(subject)
        return critical_subjects


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

    def get_remaining_semester_days(self):
        today = timezone.now()
        year = today.year

        if today.month <= 9 and today >= datetime(today.year, 3, 1, 0, 0, tzinfo=pytz.UTC):
            # Ljetni semestar
            end_date = datetime(year, 10, 1, 0, 0, tzinfo=pytz.UTC)
        elif today.month <= 9 and today < datetime(today.year, 3, 1, 0, 0, tzinfo=pytz.UTC):
            # Zimski semestar (dio u novoj godini)
            end_date = datetime(year, 3, 1, 0, 0, tzinfo=pytz.UTC)
        else:
            # Zimski semestar (dio u staroj godini)
            end_date = datetime(year + 1, 3, 1, 0, 0, tzinfo=pytz.UTC)
        tdelta = end_date - today
        return tdelta.days

    def get_total_semester_days(self):
        today = timezone.now()
        year = today.year

        if today.month <= 9 and today >= datetime(today.year, 3, 1, 0, 0, tzinfo=pytz.UTC):
            # Ljetni semestar
            start_date = datetime(year, 3, 1, 0, 0, tzinfo=pytz.UTC)
            end_date = datetime(year, 10, 1, 0, 0, tzinfo=pytz.UTC)
        elif today.month <= 9 and today < datetime(today.year, 3, 1, 0, 0, tzinfo=pytz.UTC):
            # Zimski semestar (dio u novoj godini)
            start_date = datetime(year - 1, 10, 1, 0, 0, tzinfo=pytz.UTC)
            end_date = datetime(year, 3, 1, 0, 0, tzinfo=pytz.UTC)
        else:
            # Zimski semestar (dio u staroj godini)
            start_date = datetime(year - 1, 10, 1, 0, 0, tzinfo=pytz.UTC)
            end_date = datetime(year, 3, 1, 0, 0, tzinfo=pytz.UTC)
        tdelta = end_date - start_date
        return tdelta.days
    
    def get_active_semester(self):
        today = timezone.now()

        if today.month <= 9 and today >= datetime(today.year, 3, 1, 0, 0, tzinfo=pytz.UTC):
            if self.studying_year == 1:
                semester = "2"
            elif self.studying_year == 2:
                semester = "5"
            elif self.studying_year == 3:
                semester = "6"
        else:
            if self.studying_year == 1:
                semester = "1"
            elif self.studying_year == 2:
                semester = "3"
            elif self.studying_year == 3:
                semester = "5"

        return semester
    
    def get_active_academic_year_display(self):
        year = self.get_active_academic_year()
        return "{}/{}".format(year, year+1)
    
    def get_active_academic_year(self):
        today = timezone.now()

        if today.month <= 9 and today >= datetime(today.year, 3, 1, 0, 0, tzinfo=pytz.UTC):
            return today.year
        else:
            return today.year - 1
