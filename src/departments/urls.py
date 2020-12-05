from django.urls import path
from . import views

app_name = 'departments'
urlpatterns = [
    path("create/", views.create, name='create'),
]