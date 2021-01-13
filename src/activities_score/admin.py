from django.contrib import admin
from .activities_global.models import GlobalScoreActivity
from .activities_student.models import StudentScoreActivity


admin.site.register(GlobalScoreActivity)
admin.site.register(StudentScoreActivity)
