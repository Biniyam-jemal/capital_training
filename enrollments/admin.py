# enrollments/admin.py
from django.contrib import admin
from .models import Enrollment, LessonProgress

@admin.register(Enrollment)
class EnrollmentAdmin(admin.ModelAdmin):
    list_display = ('student', 'course', 'enrolled_at', 'is_active', 'progress_percent')
    list_filter = ('is_active', 'course')

admin.site.register(LessonProgress)
