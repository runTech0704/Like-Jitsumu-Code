FROM --platform=linux/amd64 python:3.10-slim

ENV PYTHONUNBUFFERED=1

RUN mkdir /app

WORKDIR /app

COPY requirements.txt /app
RUN pip install --no-cache-dir -r /app/requirements.txt

COPY . /app

ENV PORT=8080
ENV DJANGO_SETTINGS_MODULE=myproject.settings

RUN python manage.py collectstatic --noinput
RUN python manage.py migrate

RUN python manage.py shell <<EOF
from django.contrib.auth import get_user_model
User = get_user_model()
if not User.objects.filter(username='admin').exists():
    User.objects.create_superuser('admin', 'admin@admin.com', 'adminpass')
EOF

CMD ["sh", "-c", "python manage.py runserver 0.0.0.0:${PORT:-8080}"]
