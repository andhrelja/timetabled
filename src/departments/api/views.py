from django.http import JsonResponse
from django.core.serializers import serialize
from django.contrib.auth.decorators import login_required

from departments.models import University
from departments.models import Department
from departments.models import Program

import json


@login_required
def universities(request):
    response = serialize('json', University.objects.all())
    return JsonResponse(json.loads(response), safe=False)

@login_required
def department_type_programs(request, department_pk, type_id):
    response = serialize('json', Program.objects.filter(department_id=department_pk, type=type_id))
    return JsonResponse(json.loads(response), safe=False)

@login_required
def university_departments(request, university_pk):
    response = serialize('json', Department.objects.filter(university_id=university_pk))
    return JsonResponse(json.loads(response), safe=False)


@login_required
def departments(request):
    response = serialize('json', Department.objects.all())
    return JsonResponse(json.loads(response), safe=False)


@login_required
def programs(request):
    response = serialize('json', Program.objects.all())
    return JsonResponse(json.loads(response), safe=False)

        