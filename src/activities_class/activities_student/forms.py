from django import forms
from subjects.forms import DateInput, TimeInput
from .models import StudentClassActivity


class StudentClassActivityForm(forms.ModelForm):

    def clean(self):
        cleaned_data = super(StudentClassActivityForm, self).clean()
        start_time = cleaned_data.get('start_time')
        end_time = cleaned_data.get('end_time')
        if start_time and end_time:
            if start_time > end_time:
                self.add_error("end_time", "Neispravan unos trajanja aktivnosti")
        return cleaned_data

    class Meta:
        model = StudentClassActivity
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



class StudentClassActivityAttendanceForm(StudentClassActivityForm):

    def __init__(self, *args, **kwargs):
        super(StudentClassActivityAttendanceForm, self).__init__(*args, **kwargs)
        self.initial['attended'] = True
    class Meta(StudentClassActivityForm.Meta):
        fields = (
            'type', 'attended'
        )