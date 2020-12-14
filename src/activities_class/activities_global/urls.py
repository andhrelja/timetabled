from django.urls import path
from . import views

urlpatterns = [
    path('score/<int:pk>/detail/', views.GlobalClassActivityDetailView.as_view(), name="global-detail"),
]