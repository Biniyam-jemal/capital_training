from django import forms
from .models import Course, Module, Lesson


class CourseForm(forms.ModelForm):
    class Meta:
        model = Course
        fields = ['title', 'category', 'description', 'short_description',
                  'thumbnail', 'price', 'level', 'language', 'is_published']


class ModuleForm(forms.ModelForm):
    class Meta:
        model = Module
        fields = ['title', 'order']


class LessonForm(forms.ModelForm):
    class Meta:
        model = Lesson
        fields = ['title', 'video_url', 'duration', 'order', 'is_free_preview', 'resource_file']