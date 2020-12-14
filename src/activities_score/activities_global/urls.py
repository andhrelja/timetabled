from django.urls import path
from . import views

urlpatterns = [
    path('detail/<int:pk>/', views.GlobalScoreActivityDetailView.as_view(), name="global-detail"),
]