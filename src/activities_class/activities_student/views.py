from .models import StudentClassActivity
from django.views.generic import (
    DetailView,
    CreateView,
    UpdateView,
    DeleteView
)

from datetime import date

class StudentClassActivityDetailView(DetailView):
    model = StudentClassActivity
    template_name = "activities_class/class_activity_detail.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["today"] = date.today()
        return context


class StudentClassActivityCreateView(CreateView):
    model = StudentClassActivity
    template_name = "activities_class/class_activity_form.html"
