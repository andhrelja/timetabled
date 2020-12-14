from django.urls import path
from . import views

urlpatterns = [
    path('score/<int:pk>/detail/',  views.StudentClassActivityDetailView.as_view(), name="student-detail"),
    path('create/',                 views.StudentClassActivityCreateView.as_view(), name="student-create"),
]