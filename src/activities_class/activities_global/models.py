from django.db import models
from django.urls import reverse
from datetime import timedelta
from activities_class import constraints


class GlobalClassActivity(models.Model):

    name        = models.CharField("Naziv", max_length=64)
    location    = models.CharField("Prostor", max_length=128)
    group       = models.CharField("Grupa", max_length=2, null=True, blank=True)
    type        = models.IntegerField("Tip aktivnosti", choices=constraints.TYPE_CHOICES)
    attended    = models.BooleanField("Prisustvo", default=False)
    details     = models.TextField("Dodatne informacije", null=True)
    
    subject     = models.ForeignKey("subjects.Subject", verbose_name="Kolegij", on_delete=models.CASCADE)

    active      = models.BooleanField("Aktivan", null=True)
    due_date    = models.DateField("Datum")
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
    
    def get_update_url(self):
        return reverse('activities_class:global-update', kwargs={"pk": self.pk})
    
    def get_attendance_url(self):
        return reverse('activities_class:global-attend', kwargs={"pk": self.pk})

    def __str__(self):
        string = "{} - {}".format(self.subject.code, self.get_type_display())
        return string.strip()
