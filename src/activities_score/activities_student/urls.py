from django.urls import path
from . import views


urlpatterns = [
    path('<int:pk>/detail/',         views.StudentScoreActivityDetailView.as_view(), name="student-detail"),
    path('create/<int:subject_pk>/', views.StudentScoreActivityCreateView.as_view(), name="student-create"),
]