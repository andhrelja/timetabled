from django.urls import path
from . import views

urlpatterns = [
    path('<int:pk>/detail/', views.GlobalScoreActivityDetailView.as_view(), name="global-detail"),
    path('<int:pk>/update/', views.GlobalScoreActivityUpdateView.as_view(), name="global-update"),
    path('<int:pk>/submit/', views.GlobalScoreActivitySubmitView.as_view(), name="global-submit"),
]