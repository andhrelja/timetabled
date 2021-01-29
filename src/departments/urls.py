from django.urls import path
from . import views

app_name = 'departments'
urlpatterns = [
    path("create/", views.create, name='create'),
    path("problem-report/", views.problem_report, name='problem-report'),
]