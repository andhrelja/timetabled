from django.urls import path
from . import views


urlpatterns = [
    path('<int:pk>/detail/',         views.StudentScoreActivityDetailView.as_view(), name="student-detail"),
    path('<int:pk>/update/',         views.StudentScoreActivityUpdateView.as_view(), name="student-update"),
    path('create/<int:subject_pk>/', views.StudentScoreActivityCreateView.as_view(), name="student-create"),

    path('<int:pk>/submit/',         views.StudentScoreActivitySubmitView.as_view(), name="student-submit"),
]