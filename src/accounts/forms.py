from django import forms
from django.db.models import Q
from django.contrib.auth.forms import AuthenticationForm, UsernameField
from django.contrib.auth.models import User
from departments.models import Department, Program, University


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
    
class UserForm(forms.ModelForm):
    username = forms.CharField(label="Korisničko ime", disabled=True,
        widget=forms.TextInput(attrs={'class': 'form-control'}))

    university = forms.ModelChoiceField(label="Sveučilište", queryset=University.objects.all(), empty_label=None,
        widget=forms.Select(attrs={'class': 'custom-select'}))
    department = forms.ModelChoiceField(label="Odjel", queryset=Department.objects.all(), empty_label=None,
        widget=forms.Select(attrs={'class': 'custom-select'}))
    type = forms.CharField(label="Tip studija", widget=forms.Select(
        choices=Program.TYPE_CHOICES, attrs={'class': 'custom-select'}))
    program = forms.ModelChoiceField(label="Studij", queryset=Program.objects.all(), empty_label=None,
        widget=forms.Select(attrs={'class': 'custom-select'}))
    studying_year = forms.IntegerField(label="Godina studija", widget=forms.Select(
        choices=((i, i) for i in range(1, 4)), attrs={'class': 'custom-select'}))
    
    class Meta:
        model = User
        fields = ('first_name', 'last_name', 'email', 'username')
        widgets = {
            'first_name': forms.TextInput(attrs={'class': 'form-control'}),
            'last_name': forms.TextInput(attrs={'class': 'form-control'}),
            'email': forms.EmailInput(attrs={'class': 'form-control'})
        }
    
class AuthenticationForm(AuthenticationForm):

    def __init__(self, request, *args, **kwargs):
        super(AuthenticationForm, self).__init__(request, *args, **kwargs)
        self.fields['username'].widget.attrs['class'] = "form-control"
        self.fields['password'].widget.attrs['class'] = "form-control"
