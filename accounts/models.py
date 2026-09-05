# accounts/models.py
from django.db import models
from django.contrib.auth.models import AbstractUser


class User(AbstractUser):
    class Role(models.TextChoices):
        STUDENT = 'student', 'Student'
        INSTRUCTOR = 'instructor', 'Instructor'
        ADMIN = 'admin', 'Admin'

    class InstructorStatus(models.TextChoices):
        NONE = 'none', 'Not Applied'
        PENDING = 'pending', 'Pending Review'
        APPROVED = 'approved', 'Approved'
        REJECTED = 'rejected', 'Rejected'

    # Role and Instructor fields
    role = models.CharField(max_length=20, choices=Role.choices, default=Role.STUDENT)
    instructor_status = models.CharField(
        max_length=20, 
        choices=InstructorStatus.choices, 
        default=InstructorStatus.NONE
    )
    instructor_bio = models.TextField(
        blank=True, 
        help_text="Why do you want to teach? What's your expertise?"
    )
    instructor_applied_at = models.DateTimeField(null=True, blank=True)

    # Profile fields
    profile_picture = models.ImageField(upload_to='profile_pics/', blank=True, null=True)
    bio = models.TextField(blank=True)
    phone_number = models.CharField(max_length=20, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.username} ({self.role})"

    @property
    def is_student(self):
        return self.role == self.Role.STUDENT

    @property
    def is_instructor(self):
        return self.role == self.Role.INSTRUCTOR

    @property
    def is_admin(self):
        return self.role == self.Role.ADMIN

    @property
    def is_instructor_approved(self):
        return self.instructor_status == self.InstructorStatus.APPROVED

    @property
    def is_instructor_pending(self):
        return self.instructor_status == self.InstructorStatus.PENDING