from django.contrib.auth.decorators import login_required
from django.urls import path
from . import views

urlpatterns = [
    path('<int:pk>/detail/', login_required(views.GlobalClassActivityDetailView.as_view()), name="global-detail"),
    path('<int:pk>/update/', login_required(views.GlobalClassActivityUpdateView.as_view()), name="global-update"),
    path('<int:pk>/attend/', login_required(views.GlobalClassActivityAttendedView.as_view()), name="global-attend"),
]