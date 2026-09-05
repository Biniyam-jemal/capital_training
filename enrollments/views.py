# enrollments/views.py
from django.shortcuts import get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.utils import timezone
from courses.models import Course, Lesson
from .models import Enrollment, LessonProgress


@login_required
def enroll_free(request, slug):
    course = get_object_or_404(Course, slug=slug, is_published=True)

    if not course.is_free:
        messages.error(request, "This course requires payment.")
        return redirect('courses:course_detail', slug=slug)

    enrollment, created = Enrollment.objects.get_or_create(
        student=request.user,
        course=course,
        defaults={'is_active': True}
    )
    if created:
        messages.success(request, f"You're enrolled in {course.title}!")
    else:
        messages.info(request, "You're already enrolled in this course.")

    return redirect('courses:course_detail', slug=slug)


@login_required
def mark_lesson_complete(request, lesson_id):
    lesson = get_object_or_404(Lesson, id=lesson_id)
    course = lesson.module.course

    enrollment = get_object_or_404(Enrollment, student=request.user, course=course, is_active=True)

    progress, created = LessonProgress.objects.get_or_create(
        enrollment=enrollment,
        lesson=lesson,
        defaults={'is_completed': True, 'completed_at': timezone.now()}
    )
    if not created and not progress.is_completed:
        progress.is_completed = True
        progress.completed_at = timezone.now()
        progress.save()

    enrollment.update_progress()

    messages.success(request, f"Marked '{lesson.title}' as complete.")
    return redirect('courses:course_detail', slug=course.slug)