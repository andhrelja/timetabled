from django.shortcuts import redirect, render
from django.contrib import messages
from django.contrib.messages.views import SuccessMessageMixin
from django.views.generic import (
    ListView,
    UpdateView,
    DeleteView
)

from .forms import ProblemReportForm, DepartmentCreateForm
from .models import Department

# Create your views here.
def create(request):
    form = DepartmentCreateForm(request.POST or None)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            messages.success(request, 'Odjel uspješno spremljen')
            return redirect('departments:list')

    return render(request, template_name='departments/department_form.html', context={'form': form, 'title': 'Novi odjel'})


def problem_report(request):
    form = ProblemReportForm(request.POST or None)
    if request.method == "POST":
        if form.is_valid():
            form.send_email()
            messages.success(request, "Hvala Vam na povratnoj informaciji, prijava uspješno poslana!")
            return redirect('index')
    return render(request, 'departments/problem_report.html', {'form': form})

def delete(request, pk):
    pass

class DepartmentListView(ListView):
    model = Department


class DepartmentUpdateView(SuccessMessageMixin, UpdateView):
    model = Department
    form_class = DepartmentCreateForm
    success_message = 'Odjel uspješno izmijenjen'

    def get_context_data(self, **kwargs):
        context = super(DepartmentUpdateView, self).get_context_data(**kwargs)
        context["title"] = "Uređivanje odjela"
        return context
    

class DepartmentDeleteView(DeleteView):
    model = Department
    success_url = '/departments/'
    success_message = 'Odjel uspješno izbrisan'

    def delete(self, request, *args, **kwargs):
        messages.success(self.request, self.success_message)
        return super(DepartmentDeleteView, self).delete(request, *args, **kwargs)
