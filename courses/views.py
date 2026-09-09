from django.shortcuts import render, get_object_or_404, redirect
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.db.models import Avg, Count, Q
from .models import Course, Category, Lesson, Review
from .forms import ReviewForm


def _with_rating_annotations(queryset):
    """Attach avg_rating/review_count to a Course queryset in one query, no N+1."""
    return queryset.annotate(
        avg_rating=Avg('reviews__rating', filter=Q(reviews__is_hidden=False)),
        review_count=Count('reviews', filter=Q(reviews__is_hidden=False)),
    )


def home(request):
    categories = Category.objects.all()
    featured_courses = _with_rating_annotations(
        Course.objects.filter(is_published=True)
    ).order_by('-created_at')[:8]
    return render(request, 'courses/home.html', {
        'categories': categories,
        'featured_courses': featured_courses,
    })


def course_list(request, category_slug=None):
    categories = Category.objects.all()
    courses = _with_rating_annotations(Course.objects.filter(is_published=True))

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


def _rating_distribution(course):
    """[{'stars': 5, 'count': 12, 'pct': 72}, ...] for the visible (non-hidden) reviews."""
    total = course.reviews.filter(is_hidden=False).count()
    if total == 0:
        return []
    counts = course.reviews.filter(is_hidden=False).values('rating').annotate(n=Count('id'))
    by_star = {row['rating']: row['n'] for row in counts}
    return [
        {'stars': s, 'count': by_star.get(s, 0), 'pct': round(by_star.get(s, 0) / total * 100)}
        for s in range(5, 0, -1)
    ]


# courses/views.py
def course_detail(request, slug):
    course = get_object_or_404(
        _with_rating_annotations(Course.objects.filter(is_published=True)), slug=slug
    )
    modules = course.modules.prefetch_related('lessons').all()

    is_enrolled = False
    enrollment = None
    my_review = None
    if request.user.is_authenticated:
        from enrollments.models import Enrollment
        enrollment = Enrollment.objects.filter(
            student=request.user, course=course, is_active=True
        ).first()
        is_enrolled = enrollment is not None
        if is_enrolled:
            my_review = Review.objects.filter(course=course, student=request.user).first()

    reviews = course.reviews.filter(is_hidden=False).select_related('student').order_by('-created_at')

    return render(request, 'courses/course_detail.html', {
        'course': course,
        'modules': modules,
        'is_enrolled': is_enrolled,
        'enrollment': enrollment,
        'reviews': reviews,
        'rating_distribution': _rating_distribution(course),
        'my_review': my_review,
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
        return redirect('courses:course_detail', slug=course.slug)
    
    return render(request, 'courses/watch_lesson.html', {
        'course': course,
        'lesson': lesson,
    })
@login_required
def submit_review(request, slug):
    course = get_object_or_404(Course, slug=slug, is_published=True)

    from enrollments.models import Enrollment
    if not Enrollment.objects.filter(student=request.user, course=course, is_active=True).exists():
        messages.error(request, "You must be enrolled in this course to review it.")
        return redirect('courses:course_detail', slug=slug)

    # Don't create/save anything on a GET — only look up an existing review if one exists
    review = Review.objects.filter(course=course, student=request.user).first()
    form = ReviewForm(request.POST or None, instance=review)

    if request.method == 'POST' and form.is_valid():
        review = form.save(commit=False)
        review.course = course
        review.student = request.user
        review.save()
        messages.success(request, "Your review has been saved.")
        return redirect('courses:course_detail', slug=slug)

    return render(request, 'courses/review_form.html', {'form': form, 'course': course, 'star_range': range(1, 6),})