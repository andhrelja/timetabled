from .models import GlobalClassActivity
from django.views.generic import (
    DetailView,
    CreateView,
    UpdateView,
    DeleteView
)

from datetime import date


class GlobalClassActivityDetailView(DetailView):
    model = GlobalClassActivity
    template_name = "activities_class/class_activity_detail.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["today"] = date.today()
        return context