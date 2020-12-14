from .models import GlobalScoreActivity
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
    
