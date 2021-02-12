from django.urls import path
from . import views

urlpatterns = [
    path('all-universities/', views.universities, name="universities-api"),
    path('filter/university/<int:university_pk>', views.university_departments, name="university-departments-api"),
    path('filter/program/<int:department_pk>', views.department_programs, name="department-programs-api"),
]