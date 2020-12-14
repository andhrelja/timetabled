from django.urls import path
from . import views

urlpatterns = [
    path('monthly/',  views.score_activities_monthly, name="score-monthly"),
    path('monthly/<str:start>/',  views.score_activities_monthly, name="score-monthly-navigate"),
]