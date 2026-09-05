# accounts/views.py
from django.shortcuts import render, redirect
from django.contrib.auth import login
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.utils import timezone
from .forms import StudentRegistrationForm, InstructorApplicationForm


def register(request):
    if request.method == 'POST':
        form = StudentRegistrationForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            messages.success(request, 'Welcome to Capital Training! Your account has been created.')
            return redirect('courses:home')
    else:
        form = StudentRegistrationForm()
    return render(request, 'accounts/register.html', {'form': form})


@login_required
def dashboard(request):
    if request.user.role == request.user.Role.INSTRUCTOR:
        return redirect('courses:instructor_dashboard')
    if request.user.role == request.user.Role.ADMIN:
        return redirect('/admin/')

    from enrollments.models import Enrollment
    enrollments = Enrollment.objects.filter(student=request.user, is_active=True).select_related('course')
    return render(request, 'accounts/dashboard.html', {'enrollments': enrollments})


@login_required
def student_view(request):
    """Lets an instructor preview their account as a student, bypassing the role redirect in dashboard()."""
    from enrollments.models import Enrollment
    enrollments = Enrollment.objects.filter(student=request.user, is_active=True).select_related('course')
    return render(request, 'accounts/dashboard.html', {
        'enrollments': enrollments,
        'viewing_as_student': True,
    })


@login_required
def become_instructor(request):
    user = request.user

    if user.role == user.Role.INSTRUCTOR:
        messages.info(request, 'You are already an instructor.')
        return redirect('courses:instructor_dashboard')

    if user.instructor_status == user.InstructorStatus.PENDING:
        return render(request, 'accounts/become_instructor.html', {'status': 'pending'})

    if user.instructor_status == user.InstructorStatus.REJECTED:
        # allow reapplying
        pass

    if request.method == 'POST':
        form = InstructorApplicationForm(request.POST)
        if form.is_valid():
            user.instructor_bio = form.cleaned_data['instructor_bio']
            user.instructor_status = user.InstructorStatus.PENDING
            user.instructor_applied_at = timezone.now()
            user.save()
            messages.success(request, 'Your application has been submitted for review.')
            return render(request, 'accounts/become_instructor.html', {'status': 'pending'})
    else:
        form = InstructorApplicationForm()

    return render(request, 'accounts/become_instructor.html', {
        'form': form,
        'status': user.instructor_status,
    })