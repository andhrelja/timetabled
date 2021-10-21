from django.db import models
from django.urls import reverse
from datetime import timedelta
from activities_score import constraints

class StudentScoreActivity(models.Model): 
    
    name        = models.CharField("Naziv", max_length=64)
    location    = models.CharField("Prostor", max_length=128)
    group       = models.CharField("Grupa", max_length=2, null=True, blank=True)
    type        = models.IntegerField("Tip aktivnosti", choices=constraints.TYPE_CHOICES)
    details     = models.TextField("Dodatne informacije", null=True, blank=True)

    points_accomplished = models.FloatField("Ostvareni bodovi", default=0)
    points_total    = models.FloatField("Moguće ostvarivi bodovi", default=0)

    due_date    = models.DateField("Datum")
    start_time  = models.TimeField("Vrijeme početka")
    end_time    = models.TimeField("Vrijeme završetka")

    # Foreign keys
    subject     = models.ForeignKey("subjects.Subject", verbose_name="Kolegij", on_delete=models.CASCADE)
    student     = models.ForeignKey("accounts.Student", verbose_name="Student", on_delete=models.CASCADE)
    global_activity = models.ForeignKey("activities_score.GlobalScoreActivity", 
        verbose_name="Bodovna aktivnost", null=True, blank=True, on_delete=models.CASCADE)

    # Defaults
    completed   = models.BooleanField("Predano", null=True)
    active      = models.BooleanField("Aktivan", default=True)

    class Meta:
        verbose_name = "Global - Bodovna aktivnost"
        verbose_name_plural = "Global - Bodovne aktivnosti"

    @property
    def points_percentage(self):
        if self.points_total == 0:
            return 0
        else:
            return (self.points_accomplished / self.points_total) * 100

    @property
    def duration(self):
        start = timedelta(hours=self.start_time.hour, minutes=self.start_time.minute)
        end = timedelta(hours=self.end_time.hour, minutes=self.end_time.minute)
        return end - start

    def get_absolute_url(self):
        return reverse('activities_score:student-detail', kwargs={"pk": self.pk})
    
    def get_update_url(self):
        return reverse('activities_score:student-update', kwargs={"pk": self.pk})
    
    def get_submission_url(self):
        return reverse('activities_score:student-submit', kwargs={"pk": self.pk})

    def __str__(self):
        string = "{} - {}".format(self.subject.code, self.get_type_display())
        return string.strip()
            