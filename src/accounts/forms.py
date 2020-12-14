from django import forms
from django.db.models import Q
from django.contrib.auth.forms import AuthenticationForm, UsernameField
from django.contrib.auth.models import User
from departments.models import Department, Program, University
from datetime import date


class RegisterForm(forms.Form):
    first_name = forms.CharField(label="Ime",
        widget=forms.TextInput(attrs={'class': 'form-control'}))
    last_name = forms.CharField(label="Prezime",
        widget=forms.TextInput(attrs={'class': 'form-control'}))
    username = UsernameField(label="Korisničko ime",
        widget=forms.TextInput(attrs={'class': 'form-control'}))
    email = forms.EmailField(label="Email",
        widget=forms.EmailInput(attrs={'class': 'form-control'}))
    password = forms.CharField(label="Lozinka",
        widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    password1 = forms.CharField(label="Potvrda lozinke", 
        widget=forms.PasswordInput(attrs={'class': 'form-control'}))

    def is_valid(self):
        try:
            User.objects.get(Q(username=self.data['username']) | Q(
                email=self.data['email']))
        except User.DoesNotExist:
            if self.data['password'] != self.data['password1']:
                self.add_error(None, "Lozinke se ne podudaraju")
        else:
            self.add_error(None, "Korisnik već postoji")
        return self.is_bound and not self.errors


class StudentForm(forms.Form):
    university = forms.ModelChoiceField(label="Sveučilište", queryset=University.objects.all(),
        widget=forms.Select(attrs={'class': 'custom-select', 'onchange': 'toggleDepartments()'}))
    department = forms.ModelChoiceField(label="Odjel", queryset=Department.objects.all(),
        widget=forms.Select(attrs={'class': 'custom-select', 'onchange': 'togglePrograms()'}))
    type = forms.CharField(label="Tip studija", widget=forms.Select(
        choices=Program.TYPE_CHOICES, attrs={'class': 'custom-select', 'onchange': 'togglePrograms()'}))
    program = forms.ModelChoiceField(label="Studij", queryset=Program.objects.all(),
        widget=forms.Select(attrs={'class': 'custom-select'}))
    studying_year = forms.IntegerField(label="Godina studija", widget=forms.Select(
        choices=((i, i) for i in range(1, 4)), attrs={'class': 'custom-select'}))
    


class AuthenticationForm(AuthenticationForm):

    def __init__(self, request, *args, **kwargs):
        super(AuthenticationForm, self).__init__(request, *args, **kwargs)
        self.fields['username'].widget.attrs['class'] = "form-control"
        self.fields['password'].widget.attrs['class'] = "form-control"

    def clean(self):
        cleaned_data = super(AuthenticationForm, self).clean()
        user = self.get_user()
        student = user.student

        today = date.today()
        if today.month > 9:
            year = today.year
            if student.studying_year == 1:
                semester = "1"
            elif student.studying_year == 2:
                semester = "3"
            elif student.studying_year == 3:
                semester = "5"
            else:
                semester = None
        else:
            year = today.year - 1
            if student.studying_year == 1:
                semester = "2"
            elif student.studying_year == 2:
                semester = "5"
            elif student.studying_year == 3:
                semester = "6"
            else:
                semester = None

        self.request.session['semester'] = semester
        self.request.session['academic_year'] = year
        return cleaned_data
