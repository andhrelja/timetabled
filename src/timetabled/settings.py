from pathlib import Path
import django_heroku


# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/3.1/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '+#@fju_rxn&#+ik-zb1lzahtqq(!f+()8p4%0qn-*iw92bmcvl'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = False

ALLOWED_HOSTS = []

LOGIN_URL = '/accounts/login/'
LOGIN_REDIRECT_URL = '/'

LOGOUT_URL = '/accounts/logout/'

EMAIL_HOST = 'smtp.gmail.com'
EMAIL_PORT = 587
EMAIL_HOST_USER = 'timetabled2021@gmail.com'
EMAIL_HOST_PASSWORD = 'qcrejnjsvyfcowgm'
EMAIL_USE_TLS = True

ABSOLUTE_URL_OVERRIDES = {
    'auth.user': lambda user: "/accounts/detail/{}/".format(user.id)
}

# Application definition

INSTALLED_APPS = [
    # Third pary
    #'django_extensions',
    
    'adminlte3',
    'adminlte3_theme',

    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    
    # Created Apps
    'accounts.apps.AccountsConfig',
    'activities_score.apps.ActivitiesScoreConfig',
    'activities_class.apps.ActivitiesClassConfig',
    'activities_group.apps.ActivitiesGroupConfig',
    'activities_calendar.apps.ActivitiesCalendarConfig',
    'materials_score.apps.MaterialsScoreConfig',
    'departments.apps.DepartmentsConfig',
    'subjects.apps.SubjectsConfig',
    'dashboard.apps.DashboardConfig',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'timetabled.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [BASE_DIR / 'templates'],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'timetabled.wsgi.application'


# Database
# https://docs.djangoproject.com/en/3.1/ref/settings/#databases

DATABASES = {
    'local': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'timetabled',
        'USER': 'postgres',
        'PASSWORD': 'user',
        'HOST': 'localhost'
    },
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'd752f1bihll8hq',
        'USER': 'cjhwxfatsglikf',
        'PASSWORD': 'd63ed365ec6985ca83341425f013eb0e2a63f0dc60a828f4431ee6409cc519fe',
        'HOST': 'ec2-176-34-97-213.eu-west-1.compute.amazonaws.com'
    },
}


# Password validation
# https://docs.djangoproject.com/en/3.1/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/3.1/topics/i18n/

LANGUAGE_CODE = 'hr-HR'

TIME_ZONE = 'CET'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.1/howto/static-files/

STATIC_URL = '/static/'
STATIC_ROOT = '/staticfiles/'
STATICFILES_DIRS = (
    BASE_DIR / 'static',
)

django_heroku.settings(locals())