from .models import GlobalClassActivity
from activities_class.activities_student.models import StudentClassActivity
from .forms import GlobalClassActivityForm

from django.contrib import messages
from django.shortcuts import redirect
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
    
class GlobalClassActivityUpdateView(UpdateView):
    model = GlobalClassActivity
    form_class = GlobalClassActivityForm
    template_name = "activities_class/class_activity_form.html"

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
            'subject':      self.object.subject,
            'student':      student,
            'global_activity':      self.object,
        }

        activity = StudentClassActivity.objects.create(**kwargs)
        messages.success(self.request, 'Nastavna aktivnost uspješno izmijenjena')
        return redirect(activity.get_absolute_url())        