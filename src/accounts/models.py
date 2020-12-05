from django.db import models
from django.urls import reverse

# Create your models here.
class Student(models.Model):
    STUDY_YEAR_CHOICES = ((i, i) for i in range(1, 4))

    user            = models.OneToOneField("auth.User", verbose_name="Django korisnik", on_delete=models.CASCADE)
    
    studying_year   = models.IntegerField("Godina studija", choices=STUDY_YEAR_CHOICES)
    program         = models.ForeignKey("departments.Program", verbose_name="Program", on_delete=models.CASCADE)
    subjects        = models.ManyToManyField("subjects.Subject", verbose_name="Upisani kolegiji")

    class Meta:
        verbose_name = "Student"
        verbose_name_plural = "Studenti"

    def __str__(self):
        return self.user.get_full_name()

    def get_absolute_url(self):
        return reverse("accounts:detail", kwargs={"pk": self.pk})
