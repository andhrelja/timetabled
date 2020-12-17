from django.contrib.auth.decorators import login_required
from django.urls import path
from . import views

urlpatterns = [
    path('weekly/',                login_required(views.class_activities_weekly), name="class-weekly"),
    path('weekly/<str:start>/',    login_required(views.class_activities_weekly), name="class-weekly-navigate"),

    path('monthly/',                login_required(views.class_activities_monthly), name="class-monthly"),
    path('monthly/<str:start>/',    login_required(views.class_activities_monthly), name="class-monthly-navigate"),
]