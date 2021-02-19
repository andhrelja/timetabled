from django import forms
from .models import Subject, SubjectPrograms

class DateInput(forms.DateInput):
    input_type = "date"

class TimeInput(forms.TimeInput):
    input_type = "time"


class SubjectEnrollOptionalForm(forms.Form):
    subjects = forms.ModelMultipleChoiceField(queryset=None, widget=forms.CheckboxSelectMultiple(attrs={'class': ''}))

    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request')
        super(SubjectEnrollOptionalForm, self).__init__(*args, **kwargs)
        student = self.request.user.student

        subject_ids = SubjectPrograms.objects.filter(
            program=student.program, 
            academic_year=self.request.session.get('academic_year'),
            semester=self.request.session.get('semester')
        ).values_list('subject_id')

        subjects = Subject.objects.filter(id__in=subject_ids)

        self.fields['subjects'].queryset = subjects.exclude(id__in=student.subjects.values_list('id'))
    
    def clean(self):
        cleaned_data = super(SubjectEnrollOptionalForm, self).clean()
        return cleaned_data

class SubjectEnrollForm(forms.Form):
    subjects = forms.ModelMultipleChoiceField(queryset=None, widget=forms.CheckboxSelectMultiple(attrs={'class': ''}))

    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request')
        super(SubjectEnrollForm, self).__init__(*args, **kwargs)
        student = self.request.user.student

        subject_ids = SubjectPrograms.objects.filter(
            program=student.program, 
            academic_year=self.request.session.get('academic_year')
        ).values_list('subject_id')

        subjects_available = Subject.objects.filter(id__in=subject_ids)
        self.fields['subjects'].queryset = subjects_available
        self.fields['subjects'].initial = student.subjects
    
    def clean(self):
        cleaned_data = super(SubjectEnrollForm, self).clean()
        return cleaned_data