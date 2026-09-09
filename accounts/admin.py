from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from .models import User

class CustomUserAdmin(BaseUserAdmin):
    list_display = ('username', 'email', 'role', 'instructor_status', 'is_staff', 'created_at')
    list_filter = ('role', 'instructor_status', 'is_staff')
    actions = ['approve_instructor', 'reject_instructor']

    fieldsets = BaseUserAdmin.fieldsets + (
        ('Role & Instructor Application', {
            'fields': ('role', 'instructor_status', 'instructor_bio', 'instructor_portfolio_url', 'instructor_teaching_url', 'instructor_credentials_url', 'instructor_applied_at', 'profile_picture', 'bio', 'phone_number')
        }),
    )

    @admin.action(description='Approve selected instructor applications')
    def approve_instructor(self, request, queryset):
        updated = queryset.filter(instructor_status=User.InstructorStatus.PENDING).update(
            role=User.Role.INSTRUCTOR,
            instructor_status=User.InstructorStatus.APPROVED,
        )
        self.message_user(request, f'{updated} user(s) approved as instructors.')

    @admin.action(description='Reject selected instructor applications')
    def reject_instructor(self, request, queryset):
        updated = queryset.filter(instructor_status=User.InstructorStatus.PENDING).update(
            instructor_status=User.InstructorStatus.REJECTED,
        )
        self.message_user(request, f'{updated} application(s) rejected.')

# Register only once - using the decorator approach is cleaner
admin.site.register(User, CustomUserAdmin)




from django.contrib import admin

admin.site.site_header = "Capital Training Administration"
admin.site.site_title = "Capital Training Admin"
admin.site.index_title = "Site Administration"
