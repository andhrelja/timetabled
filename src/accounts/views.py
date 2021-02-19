from django.contrib.messages.views import SuccessMessageMixin
from django.shortcuts import redirect
from django.conf import settings
from django.contrib import messages
from django.contrib.auth.views import LoginView
from django.contrib.auth.models import User
from django.contrib.auth import login, logout
from django.views.generic import (
    FormView,
    UpdateView,
    DetailView
)
from datetime import date

from .forms import (
    AuthenticationForm, 
    RegisterForm, 
    StudentForm,
    UserForm
)

from .models import Student, StudentSubjects
from subjects.models import Subject, SubjectPrograms


class UserCreateView(FormView):
    form_class = RegisterForm
    template_name = "registration/register.html"

    def form_valid(self, form):
        user = User.objects.create_user(
            first_name=form.cleaned_data['first_name'].title(),
            last_name=form.cleaned_data['last_name'].title(),
            username=form.cleaned_data['username'],
            email=form.cleaned_data['email'],
            password=form.cleaned_data['password']
        )

        if user is not None:
            login(self.request, user)
            return redirect("accounts:student-setup")
        else:
            messages.warning(self.request, "Nešto je pošlo po zlu")
            return redirect("accounts:register")



class StudentSetupView(FormView):
    form_class = StudentForm
    template_name = "accounts/student_form.html"
    success_url = settings.LOGIN_REDIRECT_URL

    def form_valid(self, form):
        program         = form.cleaned_data['program']
        studying_year   = form.cleaned_data['studying_year']

        student = Student.objects.create(user=self.request.user, program=program, studying_year=studying_year)
        set_session(self.request, student)
        academic_year   = self.request.session.get("academic_year")
        semester        = self.request.session.get("semester")
        
        subject_ids     = SubjectPrograms.objects.filter(program=program, optional=False).values_list('subject_id')
        subjects        = Subject.objects.filter(id__in=subject_ids)
        
        for subject in subjects:
            ss = StudentSubjects.objects.create(student=student, subject=subject, academic_year=academic_year, semester=semester)
            ss.ingest_points(subject, student)

        messages.success(self.request, "Dobrodošli na Timetabled stranice")
        return super(StudentSetupView, self).form_valid(form)
    

class UserDetailView(DetailView):
    model = User
    template_name = "accounts/user_detail.html"

class UserUpdateView(SuccessMessageMixin, UpdateView):
    model = User
    form_class = UserForm
    success_message = "Promjene uspješno spremljene"
    template_name = "accounts/user_form.html"

    def get_initial(self):
        object = self.get_object()
        initial = {
            'university': object.student.program.department.university,
            'department': object.student.program.department,
            'program': object.student.program,
            'studying_year': object.student.studying_year
        }
        return initial


class LoginView(LoginView):
    form_class = AuthenticationForm

    def form_valid(self, form):
        user = form.get_user()
        student = user.student
        set_session(self.request, student)
        return super(LoginView, self).form_valid(form)

    
def set_session(request, student):
    today = date.today()

    if today.month <= 9 and today >= date(today.year, 3, 1):
        # Ljetni semestar
        year = today.year - 1
        if student.studying_year == 1:
            semester = "2"
        elif student.studying_year == 2:
            semester = "4"
        elif student.studying_year == 3:
            semester = "6"
        else:
            semester = None
    elif today.month <= 9 and today < date(today.year, 3, 1):
        # Zimski semestar (dio u novoj godini)
        year = today.year - 1
        if student.studying_year == 1:
            semester = "1"
        elif student.studying_year == 2:
            semester = "3"
        elif student.studying_year == 3:
            semester = "5"
        else:
            semester = None
    else:
        # Zimski semestar (dio u staroj godini)
        year = today.year
        if student.studying_year == 1:
            semester = "1"
        elif student.studying_year == 2:
            semester = "3"
        elif student.studying_year == 3:
            semester = "5"
        else:
            semester = None

    request.session['academic_year'] = year
    request.session['semester'] = semester