from django.db import models
from django.urls import reverse
from datetime import date

ACADEMIC_YEAR_CHOICES = ((year, f"{year}/{year+1}") for year in range(date.today().year, 2018, -1))
SEMESTER_CHOICES = (
    ('1', "1. semester"),
    ('2', "2. semester"),
    ('3', "3. semester"),
    ('4', "4. semester"),
    ('5', "5. semester"),
    ('6', "6. semester"),
)


class Subject(models.Model):

    name            = models.CharField("Naziv", max_length=128)
    ects            = models.IntegerField("ECTS bodovi")
    professor       = models.CharField("Profesor", null=True, max_length=128)
    assistant       = models.CharField("Asistent", null=True, max_length=128)
    #completed       = models.BooleanField("Kolegij završen", default=False)
    academic_year   = models.IntegerField("Akademska godina", choices=ACADEMIC_YEAR_CHOICES)
    semester        = models.CharField("Semestar", choices=SEMESTER_CHOICES, max_length=1)
    code            = models.CharField("Kod", max_length=14)
    csv_file        = models.CharField("DINP - CSV datoteka", null=True, max_length=254)
    
    
    class Meta:
        verbose_name = "Kolegij"
        verbose_name_plural = "Kolegiji"

    def __str__(self):
        return self.name
    
    def get_absolute_url(self):
        return reverse('subjects:detail', kwargs={'pk': self.pk})


class SubjectPrograms(models.Model):

    subject  = models.ForeignKey("subjects.Subject", verbose_name="Kolegij", on_delete=models.CASCADE)
    program  = models.ForeignKey("departments.Program", verbose_name="Program", on_delete=models.CASCADE)
    optional = models.BooleanField("Izborni kolegij")

    class Meta:
        verbose_name = "Programi po kolegiju"
        verbose_name_plural = "Programi po kolegijima"

