@"
import os
from django.core.management.base import BaseCommand
from accounts.models import User


class Command(BaseCommand):
    help = "Creates a superuser from environment variables if one doesn't already exist."

    def handle(self, *args, **options):
        username = os.environ.get('DJANGO_SUPERUSER_USERNAME')
        email = os.environ.get('DJANGO_SUPERUSER_EMAIL')
        password = os.environ.get('DJANGO_SUPERUSER_PASSWORD')

        if not all([username, email, password]):
            self.stdout.write(self.style.WARNING('Superuser env vars not set - skipping.'))
            return

        if User.objects.filter(username=username).exists():
            self.stdout.write(self.style.NOTICE(f"Superuser '{username}' already exists - skipping."))
            return

        User.objects.create_superuser(username=username, email=email, password=password)
        self.stdout.write(self.style.SUCCESS(f"Superuser '{username}' created."))
"@ | Set-Content -Path accounts\management\commands\create_admin.py -Encoding UTF8