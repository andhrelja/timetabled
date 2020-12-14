from django.urls import path, include

app_name = 'activities_calendar'
urlpatterns = [
    path('score/', include('activities_calendar.activities_score.urls')),
    path('class/', include('activities_calendar.activities_class.urls')),
]