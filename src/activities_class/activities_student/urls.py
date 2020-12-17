from django.contrib.auth.decorators import login_required
from django.urls import path
from . import views

urlpatterns = [
    path('<int:pk>/detail/',        login_required(views.StudentClassActivityDetailView.as_view()), name="student-detail"),
    path('<int:pk>/update/',        login_required(views.StudentClassActivityUpdateView.as_view()), name="student-update"),
    path('create/',                 login_required(views.StudentClassActivityCreateView.as_view()), name="student-create"),
]