from django.core.management.base import BaseCommand
from courses.models import Lesson
import random

class Command(BaseCommand):
    help = "Seed lessons with YouTube videos"

    def handle(self, *args, **options):
        self.stdout.write("🚀 Seeding lessons with videos...")
        
        videos = [
            "https://www.youtube.com/embed/5NgNicANyqM",
            "https://www.youtube.com/embed/8ZtInClXe1Q",
            "https://www.youtube.com/embed/9gTw2ED2w4M",
            "https://www.youtube.com/embed/Q8aU2Hx3Gk0",
            "https://www.youtube.com/embed/0P2T33i-JJM",
        ]
        
        lessons = Lesson.objects.all()
        count = 0
        
        for lesson in lessons:
            if not lesson.video_url:
                lesson.video_url = random.choice(videos)
                lesson.save()
                count += 1
        
        self.stdout.write(self.style.SUCCESS(f"✅ Updated {count} lessons with video URLs"))
        self.stdout.write(self.style.SUCCESS("🎉 Done!"))
