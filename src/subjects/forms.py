from django import forms
from .models import Subject, SubjectPrograms

class DateInput(forms.DateInput):
    input_type = "date"

class TimeInput(forms.TimeInput):
    input_type = "time"


class SubjectEnrollForm(forms.Form):
    #subjects = forms.MultipleChoiceField(choices=((s.id, s.name) for s in Subject.objects.all()),
    #    widget=forms.CheckboxSelectMultiple(attrs={'class': ''}))

    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request')
        super(SubjectEnrollForm, self).__init__(*args, **kwargs)
        student = self.request.user.student

        subject_ids     = SubjectPrograms.objects.filter(program=student.program, optional=True).values_list('subject_id')
        subjects        = Subject.objects.filter(id__in=subject_ids, 
            academic_year=self.request.session.get('academic_year'), 
            semester=self.request.session.get('semester')
        )

        self.fields['subjects'].choices = ((s.id, s) for s in subjects.exclude(id__in=student.subjects.values_list('id')))
