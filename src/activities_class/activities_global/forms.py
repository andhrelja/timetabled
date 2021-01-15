from django import forms
from subjects.forms import DateInput, TimeInput
from .models import GlobalClassActivity


class GlobalClassActivityForm(forms.ModelForm):

    def clean(self):
        cleaned_data = super(GlobalClassActivityForm, self).clean()
        start_time = cleaned_data.get('start_time')
        end_time = cleaned_data.get('end_time')
        if start_time and end_time:
            if start_time > end_time:
                self.add_error("end_time", "Neispravan unos trajanja aktivnosti")
        return cleaned_data

    class Meta:
        model = GlobalClassActivity
        fields = ('name', 'location', 'type', 'attended', 'details', 'due_date', 'start_time', 'end_time')
        widgets = {
            'name':         forms.TextInput(attrs={'class': 'form-control'}),
            'location':     forms.TextInput(attrs={'class': 'form-control'}),
            'type':         forms.Select(attrs={'class': 'custom-select'}),
            'attended':     forms.CheckboxInput(attrs={'class': 'form-control'}),
            'details':      forms.Textarea(attrs={'class': 'form-control'}),
            'due_date':     DateInput(attrs={'class': 'form-control'}),
            'start_time':   TimeInput(attrs={'class': 'form-control'}),
            'end_time':     TimeInput(attrs={'class': 'form-control'}),
            'subject':      forms.TextInput(attrs={'class': 'form-control'}),
        }


class GlobalClassActivityAttendanceForm(GlobalClassActivityForm):

    def __init__(self, *args, **kwargs):
        super(GlobalClassActivityAttendanceForm, self).__init__(*args, **kwargs)
        self.initial['attended'] = True
    class Meta(GlobalClassActivityForm.Meta):
        fields = (
            'type', 'attended'
        )