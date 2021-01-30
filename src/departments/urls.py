from django.urls import path
from . import views

app_name = 'departments'
urlpatterns = [
    path("", views.DepartmentListView.as_view(), name='list'),
    path("create/", views.create, name='create'),
    path("update/<int:pk>", views.DepartmentUpdateView.as_view(), name='update'),
    path("problem-report/", views.problem_report, name='problem-report'),
    path("delete/<int:pk>", views.DepartmentDeleteView.as_view(), name='delete'),
]