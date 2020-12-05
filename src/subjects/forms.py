from django import forms
from django.forms.fields import MultipleChoiceField
from .models import Subject, SubjectPrograms

class StudentEnrollForm(forms.Form):
    subjects = forms.ModelMultipleChoiceField(queryset=Subject.objects.all(),
        widget=forms.CheckboxSelectMultiple(attrs={'class': ''}))

    def __init__(self, request, *args, **kwargs):
        super(StudentEnrollForm, self).__init__(request, *args, **kwargs)
        student = request.user.student

        subject_ids     = SubjectPrograms.objects.filter(program=student.program, optional=True).values_list('subject_id')
        subjects        = Subject.objects.filter(id__in=subject_ids, 
            academic_year=request.session.get('academic_year'), 
            semester=request.session.get('semester')
        )
        subjects = subjects.exclude(id__in=student.subjects.values('id'))

        self.fields['subjects'].queryset = subjects