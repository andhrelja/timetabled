from django.urls import path
from . import views


urlpatterns = [
    path('detail/<int:pk>/',         views.StudentScoreActivityDetailView.as_view(), name="student-detail"),
    path('create/<int:subject_pk>/', views.StudentScoreActivityCreateView.as_view(), name="student-create"),
]