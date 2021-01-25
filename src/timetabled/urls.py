from django.contrib import admin
from django.urls import path, include
from . import views

urlpatterns = [
    # Admin
    path('admin/',               admin.site.urls),

    # Home
    path('',                     views.index, name="index"),

    # Students
    path('accounts/',            include('accounts.urls')),

    # Departments
    path('departments/',         include('departments.urls')),

    # Subjects
    path('subjects/',            include('subjects.urls')),

    # Activities
    path('activities/class/',    include('activities_class.urls')),
    path('activities/group/',    include('activities_group.urls')),
    path('activities/score/',    include('activities_score.urls')),
    
    # Calendars
    path('activities/calendar/', include('activities_calendar.urls')),

    # Materials
    path('materials/score/',     include('materials_score.urls')),
    
]
