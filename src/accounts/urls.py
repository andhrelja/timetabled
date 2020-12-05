from django.urls import path
from django.contrib.auth.decorators import login_required
from django.contrib.auth.views import LogoutView
from . import views

app_name = 'accounts'
urlpatterns = [
    path("register/",   views.UserCreateView.as_view(),                     name="register"),
    path("student/",    login_required(views.StudentSetupView.as_view()),   name="student-setup"),
    path("logout/",     login_required(LogoutView.as_view()),               name="logout"),
    path("login/",      views.LoginView.as_view(),                          name="login"),

    path("detail/<int:pk>/", login_required(views.UserDetailView.as_view()), name="detail"),
]