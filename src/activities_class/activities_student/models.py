from django.db import models
from django.urls import reverse
from datetime import timedelta
from activities_class import constraints


class StudentClassActivity(models.Model):

    global_activity = models.ForeignKey("activities_class.GlobalClassActivity", verbose_name="Nebodovna aktivnost", 
        related_name="global_class_activity", null=True, blank=True, on_delete=models.CASCADE)
    student     = models.ForeignKey("accounts.Student", verbose_name="Student", 
        related_name="student_class_activity", on_delete=models.CASCADE)
    

    name        = models.CharField("Naziv", max_length=64)
    location    = models.CharField("Prostor", max_length=128)
    group       = models.CharField("Grupa", max_length=2, null=True, blank=True)
    type        = models.IntegerField("Tip aktivnosti", choices=constraints.TYPE_CHOICES)
    attended    = models.BooleanField("Prisustvo", default=False)
    details     = models.TextField("Dodatne informacije", null=True)
    
    subject     = models.ForeignKey("subjects.Subject", verbose_name="Kolegij", on_delete=models.CASCADE)

    active      = models.BooleanField("Aktivan", default=True)
    due_date    = models.DateField("Datum")
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
    
    def get_update_url(self):
        return reverse('activities_class:student-update', kwargs={"pk": self.pk})
    
    def get_attendance_url(self):
        return reverse('activities_class:student-attend', kwargs={"pk": self.pk})

    def __str__(self):
        string = "{} - {}".format(self.subject.code, self.get_type_display())
        return string.strip()
