# courses/models.py
from django.db import models
from django.conf import settings
from django.utils.text import slugify
from django.core.validators import MinValueValidator, MaxValueValidator

class Category(models.Model):
    """e.g. Programming Languages, Backend Frameworks, Frontend, Databases"""
    name = models.CharField(max_length=100, unique=True)
    slug = models.SlugField(unique=True, blank=True)
    description = models.TextField(blank=True)
    icon = models.ImageField(upload_to='category_icons/', blank=True, null=True)

    class Meta:
        verbose_name_plural = "Categories"
        ordering = ['name']

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.name)
        super().save(*args, **kwargs)

    def __str__(self):
        return self.name


class Course(models.Model):
    class Level(models.TextChoices):
        BEGINNER = 'beginner', 'Beginner'
        INTERMEDIATE = 'intermediate', 'Intermediate'
        ADVANCED = 'advanced', 'Advanced'

    title = models.CharField(max_length=200)
    slug = models.SlugField(unique=True, blank=True)
    category = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='courses')
    instructor = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.SET_NULL,
        null=True,
        related_name='courses_taught',
        limit_choices_to={'role': 'instructor'}
    )
    description = models.TextField()
    short_description = models.CharField(max_length=300, blank=True)
    thumbnail = models.ImageField(upload_to='course_thumbnails/', blank=True, null=True)
    price = models.DecimalField(max_digits=8, decimal_places=2, default=0)
    is_free = models.BooleanField(default=False)
    level = models.CharField(max_length=20, choices=Level.choices, default=Level.BEGINNER)
    language = models.CharField(max_length=50, default='English')
    is_published = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['-created_at']

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.title)
        # keep price/is_free consistent
        if self.price == 0:
            self.is_free = True
        super().save(*args, **kwargs)

    def __str__(self):
        return self.title

    @property
    def total_lessons(self):
        return Lesson.objects.filter(module__course=self).count()

    @property
    def total_duration_minutes(self):
        seconds = Lesson.objects.filter(module__course=self).aggregate(
            total=models.Sum('duration')
        )['total'] or 0
        return round(seconds / 60)


class Module(models.Model):
    """A section within a course, e.g. 'Django ORM Basics'"""
    course = models.ForeignKey(Course, on_delete=models.CASCADE, related_name='modules')
    title = models.CharField(max_length=200)
    order = models.PositiveIntegerField(default=0)

    class Meta:
        ordering = ['order']

    def __str__(self):
        return f"{self.course.title} - {self.title}"


class Lesson(models.Model):
    module = models.ForeignKey(Module, on_delete=models.CASCADE, related_name='lessons')
    title = models.CharField(max_length=200)
    slug = models.SlugField(unique=True, blank=True)
    video_url = models.URLField(max_length=500, help_text="S3/Cloudinary/Vimeo hosted video URL")
    duration = models.PositiveIntegerField(default=0, help_text="Duration in seconds")
    order = models.PositiveIntegerField(default=0)
    is_free_preview = models.BooleanField(default=False)
    resource_file = models.FileField(upload_to='lesson_resources/', blank=True, null=True)

    class Meta:
        ordering = ['order']

    def __str__(self):
        return f"{self.module.course.title} - {self.title}"



# courses/models.py — append to end of file




class Review(models.Model):
    """One rating+review per student per course."""
    course = models.ForeignKey(Course, on_delete=models.CASCADE, related_name='reviews')
    student = models.ForeignKey(
        settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='reviews'
    )
    rating = models.PositiveSmallIntegerField(
        validators=[MinValueValidator(1), MaxValueValidator(5)]
    )
    comment = models.TextField(blank=True)

    # Instructor reply — optional, lives on the same row so there's no extra join
    instructor_response = models.TextField(blank=True)
    instructor_responded_at = models.DateTimeField(null=True, blank=True)

    # Admin moderation — soft-hide instead of delete, matches your "prefer archive" rule
    is_hidden = models.BooleanField(default=False)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        constraints = [
            models.UniqueConstraint(fields=['course', 'student'], name='one_review_per_student_per_course'),
        ]
        ordering = ['-created_at']

    def __str__(self):
        return f"{self.student.username} rated {self.course.title}: {self.rating}★"