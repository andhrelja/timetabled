from .models import StudentClassActivity
from .forms import StudentClassActivityForm, StudentClassActivityAttendanceForm

from django.contrib.messages.views import SuccessMessageMixin
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


class StudentClassActivityCreateView(SuccessMessageMixin, CreateView):
    model = StudentClassActivity
    template_name = "activities_class/class_activity_form.html"
    success_message = "Nastavna aktivnost uspješno spremljena"

class StudentClassActivityUpdateView(SuccessMessageMixin, UpdateView):
    model = StudentClassActivity
    form_class = StudentClassActivityForm
    success_message = "Nastavna aktivnost uspješno spremljena"
    template_name = "activities_class/class_activity_form.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["subject"] = self.object.subject
        context["title"] = "Uredi nastavnu aktivnost"
        return context
    

class StudentClassActivityAttendedView(SuccessMessageMixin, UpdateView):
    model = StudentClassActivity
    form_class = StudentClassActivityAttendanceForm
    success_message = "Nastavna aktivnost uspješno spremljena"
    template_name = "activities_class/class_activity_form.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["subject"] = self.object.subject
        context["title"] = "Zabilježi prisustvo"
        return context
    