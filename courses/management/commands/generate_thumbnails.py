# courses/management/commands/generate_thumbnails.py
import io
import hashlib

from django.core.files.base import ContentFile
from django.core.management.base import BaseCommand
from PIL import Image, ImageDraw, ImageFont

from courses.models import Course

WIDTH, HEIGHT = 800, 450

# (keyword, color_top, color_bottom, icon)
THEMES = [
    (('flutter', 'android', 'kotlin', 'ios', 'mobile', 'swift'), '#0ea5e9', '#0369a1', 'phone'),
    (('data', 'visualization', 'analytics', 'sql', 'mysql', 'mongodb', 'database'), '#8b5cf6', '#5b21b6', 'chart'),
    (('deep learning', 'tensorflow', 'machine learning', 'ai', 'ml', 'neural'), '#ec4899', '#9d174d', 'brain'),
    (('cloud', 'aws', 'devops', 'docker', 'kubernetes'), '#38bdf8', '#0c4a6e', 'cloud'),
    (('fastapi', 'django', 'spring', 'node', 'backend', 'api', 'rest'), '#22c55e', '#15803d', 'server'),
    (('frontend', 'react', 'angular', 'html', 'css', 'javascript', 'tailwind', 'vue'), '#f97316', '#c2410c', 'code'),
    (('python', 'java', 'c++', 'programming', 'c '), '#6366f1', '#3730a3', 'code'),
]
DEFAULT_THEME = ('#64748b', '#334155', 'book')


def pick_theme(course):
    haystack = f"{course.title} {course.category.name if course.category_id else ''}".lower()
    for keywords, top, bottom, icon in THEMES:
        if any(k in haystack for k in keywords):
            return top, bottom, icon
    return DEFAULT_THEME


def draw_icon(draw, icon, cx, cy, size, color):
    s = size
    if icon == 'phone':
        draw.rounded_rectangle([cx - s * 0.28, cy - s * 0.5, cx + s * 0.28, cy + s * 0.5], radius=s * 0.12, outline=color, width=6)
        draw.ellipse([cx - s * 0.05, cy + s * 0.32, cx + s * 0.05, cy + s * 0.42], fill=color)
    elif icon == 'chart':
        base = cy + s * 0.4
        bars = [(-0.35, 0.25), (-0.1, 0.5), (0.15, 0.35), (0.4, 0.6)]
        for dx, h in bars:
            x0 = cx + dx * s
            draw.rectangle([x0, base - h * s, x0 + s * 0.18, base], fill=color)
    elif icon == 'brain':
        draw.ellipse([cx - s * 0.4, cy - s * 0.35, cx + s * 0.4, cy + s * 0.35], outline=color, width=6)
        draw.line([cx, cy - s * 0.3, cx, cy + s * 0.3], fill=color, width=5)
        draw.arc([cx - s * 0.35, cy - s * 0.3, cx + s * 0.05, cy + s * 0.1], 200, 340, fill=color, width=5)
        draw.arc([cx - s * 0.05, cy - s * 0.1, cx + s * 0.35, cy + s * 0.3], 20, 160, fill=color, width=5)
    elif icon == 'cloud':
        draw.ellipse([cx - s * 0.4, cy - s * 0.05, cx - s * 0.05, cy + s * 0.3], fill=color)
        draw.ellipse([cx - s * 0.1, cy - s * 0.25, cx + s * 0.3, cy + s * 0.3], fill=color)
        draw.ellipse([cx + s * 0.05, cy - s * 0.05, cx + s * 0.4, cy + s * 0.3], fill=color)
        draw.rectangle([cx - s * 0.4, cy + s * 0.1, cx + s * 0.4, cy + s * 0.3], fill=color)
    elif icon == 'server':
        for i, y in enumerate([-0.35, -0.05, 0.25]):
            draw.rounded_rectangle([cx - s * 0.4, cy + y * s, cx + s * 0.4, cy + y * s + s * 0.22], radius=s * 0.04, outline=color, width=5)
            draw.ellipse([cx + s * 0.28, cy + y * s + s * 0.08, cx + s * 0.34, cy + y * s + s * 0.14], fill=color)
    elif icon == 'code':
        draw.line([cx - s * 0.15, cy - s * 0.3, cx - s * 0.4, cy], fill=color, width=6)
        draw.line([cx - s * 0.4, cy, cx - s * 0.15, cy + s * 0.3], fill=color, width=6)
        draw.line([cx + s * 0.15, cy - s * 0.3, cx + s * 0.4, cy], fill=color, width=6)
        draw.line([cx + s * 0.4, cy, cx + s * 0.15, cy + s * 0.3], fill=color, width=6)
    else:  # book
        draw.rounded_rectangle([cx - s * 0.4, cy - s * 0.3, cx + s * 0.4, cy + s * 0.3], radius=s * 0.05, outline=color, width=6)
        draw.line([cx, cy - s * 0.3, cx, cy + s * 0.3], fill=color, width=5)


def make_thumbnail(course):
    top, bottom, icon = pick_theme(course)
    img = Image.new('RGB', (WIDTH, HEIGHT), top)
    draw = ImageDraw.Draw(img)

    top_rgb = Image.new('RGB', (1, 1), top).getpixel((0, 0))
    bottom_rgb = Image.new('RGB', (1, 1), bottom).getpixel((0, 0))
    for y in range(HEIGHT):
        t = y / HEIGHT
        r = int(top_rgb[0] + (bottom_rgb[0] - top_rgb[0]) * t)
        g = int(top_rgb[1] + (bottom_rgb[1] - top_rgb[1]) * t)
        b = int(top_rgb[2] + (bottom_rgb[2] - top_rgb[2]) * t)
        draw.line([(0, y), (WIDTH, y)], fill=(r, g, b))

    badge_cx, badge_cy, badge_r = 110, 110, 70
    draw.ellipse(
        [badge_cx - badge_r, badge_cy - badge_r, badge_cx + badge_r, badge_cy + badge_r],
        fill=(255, 255, 255, 255),
    )
    draw_icon(draw, icon, badge_cx, badge_cy, badge_r * 1.5, bottom)

    try:
        font = ImageFont.load_default(size=44)
    except TypeError:
        font = ImageFont.load_default()

    words = course.title.split()
    lines, current = [], ''
    for w in words:
        trial = f'{current} {w}'.strip()
        if draw.textlength(trial, font=font) > WIDTH - 80:
            lines.append(current)
            current = w
        else:
            current = trial
    if current:
        lines.append(current)

    y = HEIGHT - 60 - (len(lines) * 54)
    for line in lines:
        draw.text((40, y), line, font=font, fill='white')
        y += 54

    buf = io.BytesIO()
    img.save(buf, format='PNG')
    return buf.getvalue()


class Command(BaseCommand):
    help = "Generate a topic-branded thumbnail image for every course missing one."

    def add_arguments(self, parser):
        parser.add_argument(
            '--force', action='store_true',
            help='Regenerate thumbnails even for courses that already have one.',
        )

    def handle(self, *args, **options):
        force = options['force']
        qs = Course.objects.all() if force else Course.objects.filter(thumbnail='')
        count = 0
        for course in qs:
            image_bytes = make_thumbnail(course)
            filename = f"{course.slug or hashlib.md5(course.title.encode()).hexdigest()[:8]}.png"
            course.thumbnail.save(filename, ContentFile(image_bytes), save=True)
            count += 1
            self.stdout.write(self.style.SUCCESS(f"Generated thumbnail for: {course.title}"))

        if count == 0:
            self.stdout.write("No courses needed a thumbnail (use --force to regenerate all).")
        else:
            self.stdout.write(self.style.SUCCESS(f"Done. {count} thumbnail(s) generated."))
