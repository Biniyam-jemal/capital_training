from django.shortcuts import render, get_object_or_404, redirect
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from .models import Course, Category, Lesson


def home(request):
    categories = Category.objects.all()
    featured_courses = Course.objects.filter(is_published=True).order_by('-created_at')[:8]
    return render(request, 'courses/home.html', {
        'categories': categories,
        'featured_courses': featured_courses,
    })


def course_list(request, category_slug=None):
    categories = Category.objects.all()
    courses = Course.objects.filter(is_published=True)

    category = None
    if category_slug:
        category = get_object_or_404(Category, slug=category_slug)
        courses = courses.filter(category=category)

    # simple search
    query = request.GET.get('q')
    if query:
        courses = courses.filter(title__icontains=query)

    return render(request, 'courses/course_list.html', {
        'categories': categories,
        'courses': courses,
        'current_category': category,
        'query': query or '',
    })


# courses/views.py
def course_detail(request, slug):
    course = get_object_or_404(Course, slug=slug, is_published=True)
    modules = course.modules.prefetch_related('lessons').all()

    is_enrolled = False
    enrollment = None
    if request.user.is_authenticated:
        from enrollments.models import Enrollment
        enrollment = Enrollment.objects.filter(
            student=request.user, course=course, is_active=True
        ).first()
        is_enrolled = enrollment is not None

    return render(request, 'courses/course_detail.html', {
        'course': course,
        'modules': modules,
        'is_enrolled': is_enrolled,
        'enrollment': enrollment,
    })
@login_required
def watch_lesson(request, course_slug, lesson_slug):
    course = get_object_or_404(Course, slug=course_slug, is_published=True)
    lesson = get_object_or_404(Lesson, slug=lesson_slug, module__course=course)
    
    # Check if user is enrolled
    from enrollments.models import Enrollment
    is_enrolled = Enrollment.objects.filter(
        student=request.user, course=course, is_active=True
    ).exists()
    
    if not is_enrolled:
        messages.error(request, 'You must enroll in this course to access lessons.')
        return redirect('course_detail', slug=course.slug)
    
    return render(request, 'courses/watch_lesson.html', {
        'course': course,
        'lesson': lesson,
    })
@login_required
def enroll_course(request, course_slug):
    course = get_object_or_404(Course, slug=course_slug, is_published=True)
    
    from enrollments.models import Enrollment
    if Enrollment.objects.filter(student=request.user, course=course, is_active=True).exists():
        messages.info(request, 'You are already enrolled in this course.')
        return redirect('courses:course_detail', slug=course.slug)
    
    Enrollment.objects.create(student=request.user, course=course, is_active=True)
    messages.success(request, 'Successfully enrolled in the course!')
    return redirect('courses:course_detail', slug=course.slug)
@login_required
def instructor_dashboard(request):
    # Check if user is an instructor
    if request.user.role != 'instructor':
        messages.error(request, 'You must be an instructor to access this page.')
        return redirect('courses:home')
    
    # Get courses taught by this instructor
    courses = Course.objects.filter(instructor=request.user)
    
    context = {
        'courses': courses,
        'total_courses': courses.count(),
        'total_students': sum(course.enrollment_set.count() for course in courses),
    }
    return render(request, 'courses/instructor_dashboard.html', context)