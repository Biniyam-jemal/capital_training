# enrollments/models.py
from django.db import models
from django.conf import settings
from courses.models import Course, Lesson


class Enrollment(models.Model):
    student = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='enrollments')
    course = models.ForeignKey(Course, on_delete=models.CASCADE, related_name='enrollments')
    enrolled_at = models.DateTimeField(auto_now_add=True)
    is_active = models.BooleanField(default=True)
    progress_percent = models.PositiveSmallIntegerField(default=0)

    class Meta:
        unique_together = ('student', 'course')   # prevent duplicate enrollment
        ordering = ['-enrolled_at']

    def __str__(self):
        return f"{self.student.username} -> {self.course.title}"

    def update_progress(self):
        total = self.course.total_lessons
        if total == 0:
            self.progress_percent = 0
        else:
            completed = self.lesson_progress.filter(is_completed=True).count()
            self.progress_percent = int((completed / total) * 100)
        self.save(update_fields=['progress_percent'])


class LessonProgress(models.Model):
    enrollment = models.ForeignKey(Enrollment, on_delete=models.CASCADE, related_name='lesson_progress')
    lesson = models.ForeignKey(Lesson, on_delete=models.CASCADE)
    is_completed = models.BooleanField(default=False)
    completed_at = models.DateTimeField(null=True, blank=True)

    class Meta:
        unique_together = ('enrollment', 'lesson')

    def __str__(self):
        return f"{self.enrollment.student.username} - {self.lesson.title}"
