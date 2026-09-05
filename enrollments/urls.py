# enrollments/urls.py
from django.urls import path
from . import views

app_name = 'enrollments'

urlpatterns = [
    path('enroll/<slug:slug>/free/', views.enroll_free, name='enroll_free'),
    path('lesson/<int:lesson_id>/complete/', views.mark_lesson_complete, name='mark_lesson_complete'),
]