from django.forms import widgets
from django import forms
from subjects.forms import DateInput, TimeInput
from .models import GlobalScoreActivity


class GlobalScoreActivityForm(forms.ModelForm):

    def clean(self):
        cleaned_data = super(GlobalScoreActivityForm, self).clean()
        start_time = cleaned_data.get('start_time')
        end_time = cleaned_data.get('end_time')
        if start_time and end_time:
            if start_time > end_time:
                self.add_error("end_time", "Neispravan unos trajanja aktivnosti")
        return cleaned_data

    class Meta:
        model = GlobalScoreActivity
        fields = ('name', 'location', 'type', 'details', 'points_accomplished', 'points_total', 'completed', 'due_date', 'start_time', 'end_time')
        widgets = {
            'name':     forms.TextInput(attrs={'class': 'form-control'}),
            'location': forms.TextInput(attrs={'class': 'form-control'}),
            'type':     forms.Select(attrs={'class': 'custom-select'}),
            'details':  forms.Textarea(attrs={'class': 'form-control'}),
            'points_accomplished':  forms.NumberInput(attrs={'class': 'form-control'}),
            'points_total':         forms.NumberInput(attrs={'class': 'form-control'}),
            'completed':    forms.CheckboxInput(attrs={'class': 'form-control'}),
            'due_date':     DateInput(attrs={'class': 'form-control'}),
            'start_time':   TimeInput(attrs={'class': 'form-control'}),
            'end_time':     TimeInput(attrs={'class': 'form-control'}),
            'subject':      forms.TextInput(attrs={'class': 'form-control'}),
        }


class GlobalScoreActivitySubmitForm(GlobalScoreActivityForm):

    class Meta(GlobalScoreActivityForm.Meta):
        fields = (
            'type', 'points_accomplished', 'points_total'
        )