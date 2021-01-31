from django import forms
from django.core.mail import send_mail
from django.conf import settings

from .models import Department


class ProblemReportForm(forms.Form):
    title = forms.CharField(label="Naslov", max_length=128, required=True, widget=forms.TextInput(attrs={'class': 'form-control'}))
    description = forms.CharField(label="Opis", widget=forms.Textarea(attrs={'class': 'form-control'}), required=True, help_text="Slanje prijave je potpuno anonimno")

    def send_email(self):
        cleaned_data = super(ProblemReportForm, self).clean()

        send_mail(
            cleaned_data['title'],
            cleaned_data['description'],
            settings.EMAIL_HOST_USER,
            ['andhrelja@hotmail.com', 'lea.lakicevic716@gmail.com', 'vicenco.toma@gmail.com', 'toni.percan@gmail.com']
        )

class DepartmentCreateForm(forms.ModelForm):
    class Meta:
        model = Department
        fields = ['name', 'code', 'address', 'email', 'contact', 'web', 'university']
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Naziv'}),
            'code': forms.TextInput(attrs={'class': 'form-control'}),
            'address': forms.TextInput(attrs={'class': 'form-control'}),
            'email': forms.EmailInput(attrs={'class': 'form-control'}),
            'contact': forms.TextInput(attrs={'class': 'form-control'}),
            'web': forms.URLInput(attrs={'class': 'form-control'}),
            'university': forms.Select(attrs={'class': 'custom-select'}),
        }

