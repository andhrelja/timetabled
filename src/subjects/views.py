from django.contrib import messages
from django.core.mail import send_mail
from django.http.response import HttpResponse
from django.contrib.messages.views import SuccessMessageMixin
from django.shortcuts import redirect, render
from django.conf import settings
from django.views.generic import (
    ListView,
    DetailView,
    FormView
)


from accounts.models import Student, StudentSubjects
from .models import Subject
from .forms import SubjectEnrollForm, SubjectEnrollOptionalForm

from django.template.defaultfilters import date as _date
from datetime import date


def notification_call(request):
    students = Student.objects.all()
    messages = str()

    for student in students:
        notification_message = "<h4>Hej {},</h4><br>".format(student.user.first_name)
        notification_message += "<h4>Kroz idućih 7 dana na redu su sljedeće aktivnosti:</h4><br><ul>"
        
        due_activities = list()
        for subject in student.subjects:
            due_activities += subject.upcoming_score_activities(student)

        if due_activities:
            for activity in due_activities:
                notification_message += "<li>{} - {}, {}</li>".format(activity.get_type_display(), activity.subject, _date(activity.due_date, "l d.m.Y"))
        else:
            notification_message += "<li>Ovog tjedna nema ispitnih aktivnosti</li>"
        notification_message += "</ul><br>"
        notification_message += "<h4>Puno uspjeha u narednom tjednu!</h4>"
        notification_message += "<h5>Srdačan pozdrav od Timetabled tima</h5>"
        messages += notification_message
        send_mail(subject='Timetabled - tjedna obavijest', message="", html_message=notification_message, from_email=settings.EMAIL_HOST_USER, recipient_list=[student.user.email], )
    return HttpResponse(messages)


def search(request):
    student = request.user.student

    if request.method == "POST":
        query = request.POST.get('query')
        score_activities = student.all_score_activities
        class_activities = student.all_class_activities

        _score_activities = list()
        _class_activities = list()

        for score_activity in score_activities:
            if query.lower() in score_activity.name.lower() or query.lower() in score_activity.details.lower():
                _score_activities.append(score_activity)

        for class_activity in class_activities:
            if query.lower() in class_activity.name.lower() or query.lower() in class_activity.details.lower():
                _class_activities.append(class_activity)

        context = {
            'results': {
                'Kolegiji': student.subjects.filter(name__icontains=query),
                'Bodovne aktivnosti': _score_activities,
                'Nastavne aktivnosti': _class_activities
            }
        }

        return render(request, 'subjects/search.html', context)

class SubjectListView(ListView):
    model = Subject

    def get(self, request, *args, **kwargs):
        if request.user.is_authenticated and not request.user.student:
            return redirect('accounts:student-setup')
        else:
            return super(SubjectListView, self).get(request, *args, **kwargs)

    def get_queryset(self):
        return self.request.user.student.subjects

    def get_context_data(self, **kwargs):
        context = super(SubjectListView, self).get_context_data(**kwargs)
        student = self.request.user.student
        score_activities_total = len(student.all_score_activities)
        score_activities_completed = student.all_score_activities_completed_count()

        class_activities_total = len(student.all_class_activities)
        class_activities_completed = student.all_class_activities_completed_count()
        
        context.update({
            'score_activities_total':     score_activities_total,
            'score_activities_completed': score_activities_completed,
            'class_activities_total':     class_activities_total,
            'class_activities_completed': class_activities_completed,
            'semester_days_remaining':    student.get_remaining_semester_days(),
            'semester_days_total':        student.get_total_semester_days(),
            'today': date.today()
        })
        return context

class SubjectDetailView(DetailView):
    model = Subject

    def get(self, request, *args, **kwargs):
        self.object = self.get_object()
        if self.object.has_empty_activities(request.user.student):
            messages.warning(request, 'Ovaj kolegij sadrži ispitne aktivnosti* koje nemaju datum izvođenja')
        return super(SubjectDetailView, self).get(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super(SubjectDetailView, self).get_context_data(**kwargs)
        student = self.request.user.student
        score_activities_total = len(student.subject_score_activities(self.object))
        score_activities_completed = student.subject_score_activities_completed_count(self.object)

        class_activities_total = len(student.subject_class_activities(self.object))
        class_activities_completed = student.subject_class_activities_completed_count(self.object)

        points_percentage = self.object.points_percentage(student)

        context.update({
            'score_activities_total':     score_activities_total,
            'class_activities_total':     class_activities_total,
            'score_activities_completed': score_activities_completed,
            'class_activities_completed': class_activities_completed,
            'points_percentage':          points_percentage * 100,
            'today': date.today()
        })
        return context

class SubjectEnrollOptionalView(SuccessMessageMixin, FormView):
    form_class = SubjectEnrollOptionalForm
    template_name = 'subjects/subject_enroll_form.html'
    success_url = '/subjects/'
    success_message = "Kolegiji uspješno upisani"

    def get_form_kwargs(self):
        kwargs = super(SubjectEnrollOptionalView, self).get_form_kwargs()
        kwargs["request"] = self.request
        return kwargs
    

    def form_valid(self, form):
        subjects = form.cleaned_data['subjects']
        for subject in subjects:
            student = self.request.user.student

            ss, _ = StudentSubjects.objects.get_or_create(student=student, subject=subject, academic_year=student.get_active_academic_year())
            ss.semester = student.get_active_semester()
            ss.ingest_points(subject, student)
        return super(SubjectEnrollOptionalView, self).form_valid(form)
    
class SubjectEnrollView(SuccessMessageMixin, FormView):
    form_class = SubjectEnrollForm
    template_name = 'subjects/subject_enroll_all_form.html'
    success_url = '/subjects/'
    success_message = "Kolegiji uspješno upisani"

    def get_form_kwargs(self):
        kwargs = super(SubjectEnrollView, self).get_form_kwargs()
        kwargs["request"] = self.request
        return kwargs

    def form_valid(self, form):
        subjects = form.cleaned_data['subjects']
        student = self.request.user.student

        for ss in StudentSubjects.objects.filter(student=student, academic_year=student.get_active_academic_year()):
            if ss.subject not in subjects:
                ss.delete()
                
        for subject in subjects:
            ss, _ = StudentSubjects.objects.get_or_create(student=student, subject=subject, academic_year=student.get_active_academic_year())
            ss.semester = student.get_active_semester()
            ss.ingest_points(subject, student)
        return super(SubjectEnrollView, self).form_valid(form)