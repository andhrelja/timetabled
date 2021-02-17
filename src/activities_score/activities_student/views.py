from django.shortcuts import redirect
from django.contrib import messages
from subjects.models import Subject
from .models import StudentScoreActivity
from .forms import StudentScoreActivityForm, StudentScoreActivitySubmitForm

from django.contrib.messages.views import SuccessMessageMixin
from django.views.generic import (
    DetailView,
    CreateView,
    UpdateView,
    DeleteView
)

from datetime import date


class StudentScoreActivityDetailView(DetailView):
    model = StudentScoreActivity
    template_name = "activities_score/score_activity_detail.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["today"] = date.today()
        return context


class StudentScoreActivityCreateView(SuccessMessageMixin, CreateView):
    model = StudentScoreActivity
    form_class = StudentScoreActivityForm
    template_name = "activities_score/score_activity_form.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        subject_id = self.kwargs.get('subject_pk')
        context["subject"] = Subject.objects.get(id=subject_id)
        return context

    def form_valid(self, form):
        subject_id = self.kwargs.get('subject_pk')
        # TODO: Add points_accomplished to StudentSubjects

        self.object = form.save(commit=False)
        self.object.subject = Subject.objects.get(id=subject_id)
        self.object.student = self.request.user.student
        self.object.save()
        messages.success(self.request, "Ispitna aktivnost uspješno unesena")
        return redirect(self.object.get_absolute_url())


class StudentScoreActivityUpdateView(SuccessMessageMixin, UpdateView):
    model = StudentScoreActivity
    form_class = StudentScoreActivityForm
    template_name = "activities_score/score_activity_form.html"
    success_message = "Ispitna aktivnost uspješno izmijenjena"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["subject"] = self.object.subject
        context["title"] = "Uredi bodovnu aktivnost"
        return context


class StudentScoreActivitySubmitView(SuccessMessageMixin, UpdateView):
    model = StudentScoreActivity
    form_class = StudentScoreActivitySubmitForm
    template_name = "activities_score/score_activity_form.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["subject"] = self.object.subject
        context["title"] = "Predaj bodovnu aktivnost"
        return context
