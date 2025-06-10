#!/bin/bash
set -e

echo "Starting Django application..."

# Collect static files
echo "Collecting static files..."
python manage.py collectstatic --noinput

# Run database migrations
echo "Running database migrations..."
python manage.py migrate

# Create superuser if it doesn't exist
echo "Checking for superuser..."
python manage.py shell <<EOF
from django.contrib.auth import get_user_model
User = get_user_model()
if not User.objects.filter(username='admin').exists():
    print("Creating superuser...")
    User.objects.create_superuser('admin', 'admin@admin.com', 'adminpass')
    print("Superuser created successfully!")
else:
    print("Superuser already exists.")
EOF

echo "Starting Django server on port ${PORT:-8080}..."
exec python manage.py runserver 0.0.0.0:${PORT:-8080}
