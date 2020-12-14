from django.urls import path, include

app_name = 'activities_score'
urlpatterns = [
    path('global/', include('activities_score.activities_global.urls')),
    path('student/', include('activities_score.activities_student.urls')),
]