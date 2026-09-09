from django import forms
from .models import Course, Module, Lesson
from .models import Review


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


        # courses/forms.py — add
class ReviewForm(forms.ModelForm):
    class Meta:
        model = Review
        fields = ['rating', 'comment']
        widgets = {'rating': forms.RadioSelect(choices=[(i, i) for i in range(1, 6)])}