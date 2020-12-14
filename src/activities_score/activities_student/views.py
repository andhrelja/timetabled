from .models import StudentScoreActivity
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


class StudentScoreActivityCreateView(CreateView):
    model = StudentScoreActivity
    template_name = "activities_score/score_activity_form.html"
