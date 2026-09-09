from django.shortcuts import render, get_object_or_404, redirect
from django.contrib import messages
from accounts.decorators import instructor_required
from .models import Course, Module, Lesson
from .forms import CourseForm, ModuleForm, LessonForm
from django.db.models import Count, Q

@instructor_required
def instructor_dashboard(request):
    courses = Course.objects.filter(instructor=request.user).annotate(
        student_count=Count('enrollments', filter=Q(enrollments__is_active=True))
    )

    from enrollments.models import Enrollment
    total_students = Enrollment.objects.filter(
        course__instructor=request.user, is_active=True
    ).count()

    return render(request, 'courses/instructor_dashboard.html', {
        'courses': courses,
        'total_courses': courses.count(),
        'total_students': total_students,
    })


@instructor_required
def course_create(request):
    if request.method == 'POST':
        form = CourseForm(request.POST, request.FILES)
        if form.is_valid():
            course = form.save(commit=False)
            course.instructor = request.user
            course.save()
            messages.success(request, 'Course created. Now add modules and lessons.')
            return redirect('courses:course_edit', slug=course.slug)
    else:
        form = CourseForm()
    return render(request, 'courses/course_form.html', {'form': form, 'is_create': True})


@instructor_required
def course_edit(request, slug):
    course = get_object_or_404(Course, slug=slug, instructor=request.user)
    if request.method == 'POST':
        form = CourseForm(request.POST, request.FILES, instance=course)
        if form.is_valid():
            form.save()
            messages.success(request, 'Course updated.')
            return redirect('courses:course_edit', slug=course.slug)
    else:
        form = CourseForm(instance=course)

    modules = course.modules.prefetch_related('lessons').all()
    return render(request, 'courses/course_form.html', {
        'form': form, 'course': course, 'modules': modules, 'is_create': False,
    })


@instructor_required
def course_students(request, slug):
    course = get_object_or_404(Course, slug=slug, instructor=request.user)
    from enrollments.models import Enrollment
    enrollments = Enrollment.objects.filter(course=course, is_active=True).select_related('student')
    return render(request, 'courses/students.html', {'course': course, 'enrollments': enrollments})


@instructor_required
def module_create(request, slug):
    course = get_object_or_404(Course, slug=slug, instructor=request.user)
    if request.method == 'POST':
        form = ModuleForm(request.POST)
        if form.is_valid():
            module = form.save(commit=False)
            module.course = course
            module.save()
            messages.success(request, 'Module added.')
            return redirect('courses:course_edit', slug=course.slug)
    else:
        form = ModuleForm()
    return render(request, 'courses/module_form.html', {'form': form, 'course': course})


@instructor_required
def lesson_create(request, module_id):
    module = get_object_or_404(Module, id=module_id, course__instructor=request.user)
    if request.method == 'POST':
        form = LessonForm(request.POST, request.FILES)
        if form.is_valid():
            lesson = form.save(commit=False)
            lesson.module = module
            lesson.save()
            messages.success(request, 'Lesson added.')
            return redirect('courses:course_edit', slug=module.course.slug)
    else:
        form = LessonForm()
    return render(request, 'courses/lesson_form.html', {
        'form': form, 'module': module, 'course_slug': module.course.slug,
    })


@instructor_required
def lesson_edit(request, lesson_id):
    lesson = get_object_or_404(Lesson, id=lesson_id, module__course__instructor=request.user)
    if request.method == 'POST':
        form = LessonForm(request.POST, request.FILES, instance=lesson)
        if form.is_valid():
            form.save()
            messages.success(request, 'Lesson updated.')
            return redirect('courses:course_edit', slug=lesson.module.course.slug)
    else:
        form = LessonForm(instance=lesson)
    return render(request, 'courses/lesson_form.html', {
        'form': form, 'lesson': lesson, 'course_slug': lesson.module.course.slug,
    })


@instructor_required
def lesson_delete(request, lesson_id):
    lesson = get_object_or_404(Lesson, id=lesson_id, module__course__instructor=request.user)
    course_slug = lesson.module.course.slug
    lesson.delete()
    messages.success(request, 'Lesson deleted.')
    return redirect('courses:course_edit', slug=course_slug)
@instructor_required
def course_delete(request, slug):
    course = get_object_or_404(Course, slug=slug, instructor=request.user)
    if request.method == 'POST':
        if course.orders.exists():
            messages.error(
                request,
                f'"{course.title}" has order history and can\'t be deleted, to protect your sales records. '
                f'Unpublish it instead to hide it from students.'
            )
        else:
            title = course.title
            course.delete()
            messages.success(request, f'"{title}" has been deleted.')
    return redirect('courses:instructor_dashboard')


@instructor_required
def course_toggle_publish(request, slug):
    course = get_object_or_404(Course, slug=slug, instructor=request.user)
    if request.method == 'POST':
        course.is_published = not course.is_published
        course.save(update_fields=['is_published'])
        state = 'published' if course.is_published else 'unpublished'
        messages.success(request, f'"{course.title}" is now {state}.')
    return redirect('courses:instructor_dashboard')


@instructor_required
def remove_student(request, slug, enrollment_id):
    course = get_object_or_404(Course, slug=slug, instructor=request.user)
    from enrollments.models import Enrollment
    enrollment = get_object_or_404(Enrollment, id=enrollment_id, course=course)
    if request.method == 'POST':
        enrollment.is_active = False
        enrollment.save(update_fields=['is_active'])
        messages.success(request, f'{enrollment.student.username} has been removed from "{course.title}".')
    return redirect('courses:course_students', slug=course.slug)