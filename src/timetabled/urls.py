from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/',              admin.site.urls),

    # Custom paths
    path('activities/class/',   include('activities_class.urls')),
    path('activities/group/',   include('activities_group.urls')),
    path('activities/score/',   include('activities_score.urls')),
    path('materials/score/',    include('materials_score.urls')),
    path('departments/',        include('departments.urls')),
    path('subjects/',           include('subjects.urls')),
    path('accounts/',           include('accounts.urls')),
]
