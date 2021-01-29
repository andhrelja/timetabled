from django import forms
from django.core.mail import send_mail
from django.conf import settings


class ProblemReportForm(forms.Form):
    title = forms.CharField(label="Naslov", max_length=128, required=True, widget=forms.TextInput(attrs={'class': 'form-control'}))
    description = forms.CharField(label="Opis", widget=forms.Textarea(attrs={'class': 'form-control'}), required=True, help_text="Slanje prijave je potpuno anonimno")

    def send_email(self):
        cleaned_data = self.clean()

        send_mail(
            cleaned_data['title'],
            cleaned_data['description'],
            settings.EMAIL_HOST_USER,
            ['andhrelja@hotmail.com']
        )