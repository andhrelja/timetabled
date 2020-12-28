from django.contrib.messages.views import SuccessMessageMixin
from django.shortcuts import redirect, render
from django.conf import settings
from django.views.generic import (
    ListView,
    DetailView,
    FormView
)

from subjects.forms import SubjectEnrollForm
from accounts.models import StudentSubjects
from .models import Subject

from datetime import date, datetime

class SubjectListView(ListView):
    model = Subject

    def get(self, request, *args, **kwargs):
        if request.user.is_authenticated and not request.user.student:
            return redirect('accounts:student-setup')
        else:
            return super(SubjectListView, self).get(request, *args, **kwargs)

    def get_queryset(self):
        student         = self.request.user.student
        return student.subjects

    def get_context_data(self, **kwargs):
        context = super(SubjectListView, self).get_context_data(**kwargs)
        student = self.request.user.student
        score_activities_total = len(student.all_score_activities)
        score_activities_completed = student.all_score_activities_completed_count()

        class_activities_total = len(student.all_class_activities)
        class_activities_completed = student.all_class_activities_completed_count()
        
        context.update({
            'score_activities_total':     score_activities_total,
            'score_activities_completed': score_activities_completed,
            'class_activities_total':     class_activities_total,
            'class_activities_completed': class_activities_completed,
            'semester_days_remaining':    student.get_remaining_semester_days(),
            'today': date.today()
        })
        return context

class SubjectDetailView(DetailView):
    model = Subject

    def get_context_data(self, **kwargs):
        context = super(SubjectDetailView, self).get_context_data(**kwargs)
        student = self.request.user.student
        score_activities_total = len(student.subject_score_activities(self.object))
        score_activities_completed = student.subject_score_activities_completed_count(self.object)

        class_activities_total = len(student.subject_class_activities(self.object))
        class_activities_completed = student.subject_class_activities_completed_count(self.object)

        points_percentage = self.object.points_percentage(student)

        context.update({
            'score_activities_total':     score_activities_total,
            'score_activities_completed': score_activities_completed,
            'class_activities_total':     class_activities_total,
            'class_activities_completed': class_activities_completed,
            'points_percentage':          points_percentage,
            'today': date.today()
        })
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

            ss = StudentSubjects.objects.create(student=student, subject=subject, academic_year=subject.academic_year)
            ss.ingest_points(subject, student)
        return super(SubjectEnrollView, self).form_valid(form)
    
