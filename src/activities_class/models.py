from django.db import models
from django.shortcuts import reverse
from datetime import timedelta

TYPE_CHOICES = ((0, "Predavanja"), (1, "Vježbe"), (2, "Predavanja i vježbe"), (3, "Ostalo"))

class GlobalClassActivity(models.Model):

    name        = models.CharField("Naziv", max_length=64)
    location    = models.CharField("Prostor", max_length=128)
    type        = models.IntegerField("Tip aktivnosti", choices=TYPE_CHOICES)
    details     = models.TextField("Dodatne informacije", null=True)
    
    subject     = models.ForeignKey("subjects.Subject", verbose_name="Kolegij", on_delete=models.CASCADE)

    date        = models.DateField("Datum")
    start_time  = models.TimeField("Vrijeme početka")
    end_time    = models.TimeField("Vrijeme završetka")

    class Meta:
        verbose_name = "Global - Nebodovna aktivnost"
        verbose_name_plural = "Global - Nebodovne aktivnosti"

    @property
    def duration(self):
        start = timedelta(hours=self.start_time.hour, minutes=self.start_time.minute)
        end = timedelta(hours=self.end_time.hour, minutes=self.end_time.minute)
        return end - start

    def get_absolute_url(self):
        return reverse('activities_class:global-detail', kwargs={"pk": self.pk})

    def __str__(self):
        return self.name.strip()


class StudentClassActivity(models.Model):

    global_activity = models.ForeignKey("activities_class.GlobalClassActivity", verbose_name="Nebodovna aktivnost", 
        related_name="global_class_activity", null=True, blank=True, on_delete=models.CASCADE)
    student     = models.ForeignKey("accounts.Student", verbose_name="Student", 
        related_name="student_class_activity", on_delete=models.CASCADE)
    

    name        = models.CharField("Naziv", max_length=64)
    location    = models.CharField("Prostor", max_length=128)
    type        = models.IntegerField("Tip aktivnosti", choices=TYPE_CHOICES)
    details     = models.TextField("Dodatne informacije", null=True)
    
    subject     = models.ForeignKey("subjects.Subject", verbose_name="Kolegij", on_delete=models.CASCADE)

    date        = models.DateField("Datum")
    start_time  = models.TimeField("Vrijeme početka")
    end_time    = models.TimeField("Vrijeme završetka")

    class Meta:
        verbose_name = "Student - Nebodovna aktivnost"
        verbose_name_plural = "Student - Nebodovne aktivnosti"

    @property
    def duration(self):
        start = timedelta(hours=self.start_time.hour, minutes=self.start_time.minute)
        end = timedelta(hours=self.end_time.hour, minutes=self.end_time.minute)
        return end - start

    def get_absolute_url(self):
        return reverse('activities_class:student-detail', kwargs={"pk": self.pk})

    def __str__(self):
        return self.name.strip()
            