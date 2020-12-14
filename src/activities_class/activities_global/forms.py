from django import forms
from subjects.forms import DateInput, TimeInput
from .models import GlobalClassActivity


class GlobalClassActivityForm(forms.ModelForm):

    def clean(self):
        cleaned_data = super(GlobalClassActivityForm, self).clean()
        if cleaned_data.get('start_time') > cleaned_data.get('end_time'):
            self.add_error("end_time", "Neispravan unos početnog ili završnog vremena")
        return cleaned_data

    class Meta:
        model = GlobalClassActivity
        fields = ('name', 'location', 'type', 'details', 'due_date', 'start_time', 'end_time')
        widgets = {
            'name':         forms.TextInput(attrs={'class': 'form-control'}),
            'location':     forms.TextInput(attrs={'class': 'form-control'}),
            'type':         forms.Select(attrs={'class': 'custom-select'}),
            'details':      forms.Textarea(attrs={'class': 'form-control'}),
            'due_date':     DateInput(attrs={'class': 'form-control'}),
            'start_time':   TimeInput(attrs={'class': 'form-control'}),
            'end_time':     TimeInput(attrs={'class': 'form-control'}),
            'subject':      forms.TextInput(attrs={'class': 'form-control'}),
        }