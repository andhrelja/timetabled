from django.shortcuts import redirect, render
from django.contrib import messages

from .forms import ProblemReportForm

# Create your views here.
def create(request):
    return render(request, template_name='departments/create.html')

def problem_report(request):
    form = ProblemReportForm(request.POST or None)
    if request.method == "POST":
        if form.is_valid():
            form.send_email()
            messages.success(request, "Hvala Vam na povratnoj informaciji, prijava uspješno poslana!")
            return redirect('index')
    return render(request, 'departments/problem_report.html', {'form': form})