from django.db import models
from django.shortcuts import reverse
from datetime import timedelta

TYPE_CHOICES = (
    (0, "Kolokvij"), 
    (1, "Seminar"), 
    (2, "Prezentacija"), 
    (3, "Domaća zadaća"), 
    (4, "Laboratorijske vježbe"), 
    (5, "Završni ispit"), 
    (6, "Ostalo")
)

class GlobalScoreActivity(models.Model):

    name        = models.CharField("Naziv", max_length=64)
    location    = models.CharField("Prostor", max_length=128)
    type        = models.IntegerField("Tip aktivnosti", choices=TYPE_CHOICES)
    details     = models.TextField("Dodatne informacije", null=True)
    subject     = models.ForeignKey("subjects.Subject", verbose_name="Kolegij", on_delete=models.CASCADE)

    points_achieved = models.FloatField("Ostvareni bodovi", null=True, blank=True)
    points_total    = models.FloatField("Moguće ostvarivi bodovi")

    date  = models.DateField("Datum")
    start_time  = models.TimeField("Vrijeme početka")
    end_time    = models.TimeField("Vrijeme završetka")

    class Meta:
        verbose_name = "Global - Bodovna aktivnost"
        verbose_name_plural = "Global - Bodovne aktivnosti"

    @property
    def duration(self):
        start = timedelta(hours=self.start_time.hour, minutes=self.start_time.minute)
        end = timedelta(hours=self.end_time.hour, minutes=self.end_time.minute)
        return end - start

    def get_absolute_url(self):
        return reverse('activities_score:global-detail', kwargs={"pk": self.pk})

    def __str__(self):
        return self.name.strip()


class StudentScoreActivity(models.Model):

    global_activity = models.ForeignKey("activities_score.GlobalScoreActivity", verbose_name="Bodovna aktivnost", 
        related_name="global_score_activity", null=True, blank=True, on_delete=models.CASCADE)
    student     = models.ForeignKey("accounts.Student", verbose_name="Student", 
        related_name="student_score_activity", on_delete=models.CASCADE)
    
    name        = models.CharField("Naziv", max_length=64)
    location    = models.CharField("Prostor", max_length=128)
    type        = models.IntegerField("Tip aktivnosti", choices=TYPE_CHOICES)
    details     = models.TextField("Dodatne informacije", null=True)
    subject     = models.ForeignKey("subjects.Subject", verbose_name="Kolegij", on_delete=models.CASCADE)

    points_achieved = models.FloatField("Ostvareni bodovi")
    points_total    = models.FloatField("Moguće ostvarivi bodovi")

    date        = models.DateField("Datum")
    start_time  = models.TimeField("Vrijeme početka")
    end_time    = models.TimeField("Vrijeme završetka")

    class Meta:
        verbose_name = "Global - Bodovna aktivnost"
        verbose_name_plural = "Global - Bodovne aktivnosti"

    @property
    def duration(self):
        start = timedelta(hours=self.start_time.hour, minutes=self.start_time.minute)
        end = timedelta(hours=self.end_time.hour, minutes=self.end_time.minute)
        return end - start

    def get_absolute_url(self):
        return reverse('activities_score:student-detail', kwargs={"pk": self.pk})

    def __str__(self):
        return self.name.strip()
            