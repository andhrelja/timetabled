from .models import GlobalScoreActivity
from activities_score.activities_student.models import StudentScoreActivity
from .forms import GlobalScoreActivityForm, GlobalScoreActivitySubmitForm


from django.contrib import messages
from django.shortcuts import redirect
from django.views.generic import (
    DetailView,
    CreateView,
    UpdateView,
    DeleteView
)

from datetime import date


class GlobalScoreActivityDetailView(DetailView):
    model = GlobalScoreActivity
    template_name = "activities_score/score_activity_detail.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["today"] = date.today()
        return context
    
class GlobalScoreActivityUpdateView(UpdateView):
    model = GlobalScoreActivity
    form_class = GlobalScoreActivityForm
    template_name = "activities_score/score_activity_form.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["subject"] = self.object.subject
        context["title"] = "Uredi bodovnu aktivnost"
        return context
    

    def form_valid(self, form):
        self.object = form.save(commit=False)
        student = self.request.user.student

        kwargs = {
            'name':         self.object.name,
            'location':     self.object.location,
            'type':         self.object.type,
            'group':        self.object.group,
            'details':      self.object.details,
            'due_date':     self.object.due_date,
            'start_time':   self.object.start_time,
            'end_time':     self.object.end_time,
            'completed':    self.object.completed,
            'subject':      self.object.subject,
            'student':      student,
            'global_activity':      self.object,
            'points_accomplished':  self.object.points_accomplished,
            'points_total':         self.object.points_total,
        }

        activity = StudentScoreActivity.objects.create(**kwargs)
        messages.success(self.request, 'Ispitna aktivnost uspješno izmijenjena')
        return redirect(activity.get_absolute_url())


class GlobalScoreActivitySubmitView(UpdateView):
    model = GlobalScoreActivity
    form_class = GlobalScoreActivitySubmitForm
    template_name = "activities_score/score_activity_form.html"


    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["subject"] = self.object.subject
        context["title"] = "Predaj bodovnu aktivnost"
        return context
    
    def form_valid(self, form):
        self.object = form.save(commit=False)
        student = self.request.user.student

        kwargs = {
            'name':         self.object.name,
            'location':     self.object.location,
            'type':         self.object.type,
            'group':        self.object.group,
            'details':      self.object.details,
            'due_date':     self.object.due_date,
            'start_time':   self.object.start_time,
            'end_time':     self.object.end_time,
            'completed':    True,
            'subject':      self.object.subject,
            'student':      student,
            'global_activity':      self.object,
            'points_accomplished':  self.object.points_accomplished,
            'points_total':         self.object.points_total,
        }

        activity = StudentScoreActivity.objects.create(**kwargs)
        messages.success(self.request, 'Ispitna aktivnost uspješno predana')
        return redirect(activity.get_absolute_url())
