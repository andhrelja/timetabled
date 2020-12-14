from django.shortcuts import redirect
from django.conf import settings

def index(request):
    return redirect(settings.LOGIN_REDIRECT_URL)