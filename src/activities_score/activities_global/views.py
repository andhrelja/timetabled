from .models import GlobalScoreActivity
from activities_score.activities_student.models import StudentScoreActivity
from .forms import GlobalScoreActivityForm

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

    def form_valid(self, form):
        self.object = form.save(commit=False)
        student = self.request.user.student

        kwargs = {
            'name':         self.object.name,
            'location':     self.object.location,
            'type':         self.object.type,
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