# courses/admin.py
from django.contrib import admin
from .models import Category, Course, Module, Lesson
from .models import Review


class LessonInline(admin.TabularInline):
    model = Lesson
    extra = 1


class ModuleInline(admin.TabularInline):
    model = Module
    extra = 1


@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ('name', 'slug')
    prepopulated_fields = {'slug': ('name',)}


@admin.register(Course)
class CourseAdmin(admin.ModelAdmin):
    list_display = ('title', 'category', 'instructor', 'price', 'is_free', 'is_published')
    list_filter = ('category', 'level', 'is_published', 'is_free')
    search_fields = ('title', 'description')
    prepopulated_fields = {'slug': ('title',)}
    inlines = [ModuleInline]


@admin.register(Module)
class ModuleAdmin(admin.ModelAdmin):
    list_display = ('title', 'course', 'order')
    inlines = [LessonInline]


@admin.register(Lesson)
class LessonAdmin(admin.ModelAdmin):
    list_display = ('title', 'module', 'order', 'is_free_preview', 'duration')


# courses/admin.py — add
@admin.register(Review)
class ReviewAdmin(admin.ModelAdmin):
    list_display = ('course', 'student', 'rating', 'is_hidden', 'created_at')
    list_filter = ('rating', 'is_hidden')
    actions = ['hide_reviews', 'unhide_reviews']

    @admin.action(description='Hide selected reviews')
    def hide_reviews(self, request, queryset):
        queryset.update(is_hidden=True)

    @admin.action(description='Unhide selected reviews')
    def unhide_reviews(self, request, queryset):
        queryset.update(is_hidden=False)