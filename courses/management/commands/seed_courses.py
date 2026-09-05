# courses/management/commands/seed_courses.py
from django.core.management.base import BaseCommand
from django.utils.text import slugify
from courses.models import Category, Course, Module, Lesson


class Command(BaseCommand):
    help = "Seed initial categories and courses for Capital Software Training"

    def handle(self, *args, **options):
        structure = {
            "Programming Languages": [
                "Java", "C++", "C", "JavaScript", "Python",
            ],
            "Databases": [
                "MySQL", "MongoDB",
            ],
            "Backend Frameworks": [
                "Django", "REST API with Django", "FastAPI", "Spring Boot", "Node.js",
            ],
            "Frontend": [
                "HTML & CSS", "JavaScript for Frontend", "React", "Tailwind CSS",
            ],
        }

        for category_name, course_titles in structure.items():
            category, _ = Category.objects.get_or_create(name=category_name)

            for title in course_titles:
                # Generate a unique slug
                base_slug = slugify(title)
                slug = base_slug
                counter = 1
                while Course.objects.filter(slug=slug).exists():
                    slug = f"{base_slug}-{counter}"
                    counter += 1

                course, created = Course.objects.get_or_create(
                    title=title,
                    defaults={
                        "category": category,
                        "slug": slug,  # Use the unique slug
                        "description": f"Learn {title} from scratch with hands-on projects.",
                        "short_description": f"A complete {title} course for beginners to advanced.",
                        "price": 0,
                        "is_free": True,
                        "is_published": True,
                        "level": Course.Level.BEGINNER,
                        "language": "English",
                    }
                )

                if created:
                    module = Module.objects.create(course=course, title="Introduction", order=1)
                    Lesson.objects.create(
                        module=module,
                        title=f"Welcome to {title}",
                        video_url="https://www.youtube.com/watch?v=dQw4w9WgXcQ",
                        duration=300,
                        order=1,
                        is_free_preview=True,
                    )
                    self.stdout.write(self.style.SUCCESS(f"Created course: {title}"))
                else:
                    self.stdout.write(f"Already exists, skipped: {title}")

        self.stdout.write(self.style.SUCCESS("Seeding complete."))