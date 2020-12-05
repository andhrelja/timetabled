from itertools import chain
from django.shortcuts import reverse, redirect, render
from django.urls import reverse_lazy
from django.contrib import messages
from django.views.generic import (
    ListView,
    DetailView,
    FormView
)
from django.db.models import Q

from subjects.forms import StudentEnrollForm

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

class SubjectEnrollView(FormView):
    form_class = StudentEnrollForm
    template_name = 'subjects/student_enroll_form.html'

    def form_valid(self, form):
        return super(SubjectEnrollView, self).form_valid(form)


def enroll(request):
    student = request.user.student
    subjects = Subject.objects.filter(program=student.program, optional=True, academic_year=academic_year, semester=semester)
    subjects = subjects.exclude(id__in=student.subjects.values('id'))
    
    if request.method == "POST":
        for subject_id in request.POST.getlist('subject_ids', []):
            subject = subjects.get(id=subject_id)
            student.subjects.add(subject)
            student.save()
            messages.success(request, "Subject {} successfully enrolled".format(subject))
        return redirect("subjects:list")

    context = {
        'subjects': subjects
    }
    return render(request, "subjects/enroll_form.html", context)
