from django.contrib.messages.views import SuccessMessageMixin
from django.views.generic import (
    ListView,
    DetailView,
    FormView
)

from subjects.forms import SubjectEnrollForm
from accounts.models import StudentSubjects
from .models import Subject

from datetime import date

class SubjectListView(ListView):
    model = Subject

    def get_queryset(self):
        student         = self.request.user.student
        academic_year   = self.request.session.get('academic_year')
        semester        = self.request.session.get('semester')
        return student.subjects.filter(academic_year=academic_year, semester=semester)

class SubjectDetailView(DetailView):
    model = Subject

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["today"] = date.today()
        return context    

class SubjectEnrollView(SuccessMessageMixin, FormView):
    form_class = SubjectEnrollForm
    template_name = 'subjects/subject_enroll_form.html'
    success_url = '/subjects/'
    success_message = "Kolegiji uspješno upisani"

    def get_form_kwargs(self):
        kwargs = super(SubjectEnrollView, self).get_form_kwargs()
        kwargs["request"] = self.request
        return kwargs
    

    def form_valid(self, form):
        subject_ids = form.cleaned_data['subjects']
        for subject_id in subject_ids:
            student = self.request.user.student
            subject = Subject.objects.get(id=subject_id)

            ss = StudentSubjects.objects.create(student=student, subject=subject)
            ss.ingest_points()
        return super(SubjectEnrollView, self).form_valid(form)
    
