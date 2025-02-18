import environ
import os
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent

# Inicializar entorno
env = environ.Env()
environ.Env.read_env(os.path.join(BASE_DIR, '.env'))

# Cargar desde ConfigMap y Secret
SECRET_KEY = os.getenv('DJANGO_SECRET_KEY', 'fallback-secret')
ALLOWED_HOSTS = os.getenv('ALLOWED_HOSTS', 'localhost,127.0.0.1').split(',')

DEBUG = env.bool('DEBUG', default=False)

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.getenv('DATABASE_NAME', BASE_DIR / 'db.sqlite3'),
    }
}
