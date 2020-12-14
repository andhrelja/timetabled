from django.urls import path, include
from . import views

urlpatterns = [
    path('monthly/',  views.class_activities_monthly, name="class-monthly"),
    path('monthly/<str:start>/',  views.class_activities_monthly, name="class-monthly-navigate"),
]