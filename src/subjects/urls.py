from django.urls import path
from django.contrib.auth.decorators import login_required
from . import views

app_name = "subjects"
urlpatterns = [
    path("",                    login_required(views.SubjectListView.as_view()), name="list"),
    path("enroll/",             login_required(views.SubjectEnrollView.as_view()), name="enroll"),
    path("enroll/optional/",    login_required(views.SubjectEnrollOptionalView.as_view()), name="enroll-optional"),
    path("detail/<int:pk>/",    login_required(views.SubjectDetailView.as_view()), name="detail"),

    path('notification-call/',  views.notification_call, name="notification_call"),
]