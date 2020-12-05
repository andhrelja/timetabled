from django.db import models
from django.urls import reverse

# Create your models here.

class University(models.Model):

    name        = models.CharField("Naziv", max_length=128)
    code        = models.CharField("Kod", max_length=8)
    address     = models.TextField("Adresa")
    email       = models.EmailField("Email", max_length=254)
    contact     = models.CharField("Kontakt broj", max_length=16)

    class Meta:
        verbose_name = "Sveučilište"
        verbose_name_plural = "Sveučilišta"

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse("departments:universities-list")


class Department(models.Model):

    name        = models.CharField("Naziv", max_length=128)
    code        = models.CharField("Kod", max_length=8)
    address     = models.TextField("Adreasa")
    email       = models.EmailField("Email", max_length=254)
    contact     = models.CharField("Kontakt broj", max_length=16)
    web         = models.CharField("Web", max_length=254)

    university  = models.ForeignKey("departments.University", verbose_name="Sveučilište", on_delete=models.CASCADE)

    class Meta:
        verbose_name = "Odjel"
        verbose_name_plural = "Odjeli"

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse("departments:department-list")


class Program(models.Model):
    TYPE_CHOICES = (
        ('preddiplomski', "Preddiplomski"),
        ('diplomski', "Diplomski"),
    )

    name        = models.CharField("Naziv", max_length=128)
    type        = models.CharField("Tip studija", choices=TYPE_CHOICES, max_length=50)
    department  = models.ForeignKey("departments.Department", verbose_name="Odjel", on_delete=models.CASCADE)

    class Meta:
        verbose_name = "Studij"
        verbose_name_plural = "Studiji"

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse("departments:program-list")