from django.urls import path, include

app_name = 'activities_class'
urlpatterns = [
    path('global/', include('activities_class.activities_global.urls')),
    path('student/', include('activities_class.activities_student.urls')),
]