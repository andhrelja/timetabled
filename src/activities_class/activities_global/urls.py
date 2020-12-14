from django.urls import path
from . import views

urlpatterns = [
    path('<int:pk>/detail/', views.GlobalClassActivityDetailView.as_view(), name="global-detail"),
    path('<int:pk>/update/', views.GlobalClassActivityUpdateView.as_view(), name="global-update"),
]