from django.contrib.auth.decorators import login_required
from django.urls import path
from . import views

urlpatterns = [
    path('monthly/',                login_required(views.score_activities_monthly), name="score-monthly"),
    path('monthly/<str:start>/',    login_required(views.score_activities_monthly), name="score-monthly-navigate"),

    path('weekly/',                login_required(views.score_activities_weekly), name="score-weekly"),
    path('weekly/<str:start>/',    login_required(views.score_activities_weekly), name="score-weekly-navigate"),
]