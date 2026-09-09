from django.urls import path
from . import views, instructor_views

app_name = 'courses'

urlpatterns = [
    path('', views.home, name='home'),
    path('courses/', views.course_list, name='course_list'),
    path('courses/category/<slug:category_slug>/', views.course_list, name='course_list_by_category'),
    path('courses/<slug:slug>/', views.course_detail, name='course_detail'),
    path('courses/<slug:slug>/review/', views.submit_review, name='submit_review'),
    path('course/<slug:course_slug>/lesson/<slug:lesson_slug>/', views.watch_lesson, name='watch_lesson'),

    # --- Instructor area ---
    path('instructor/dashboard/', instructor_views.instructor_dashboard, name='instructor_dashboard'),
    path('instructor/courses/create/', instructor_views.course_create, name='course_create'),
    path('instructor/courses/<slug:slug>/edit/', instructor_views.course_edit, name='course_edit'),
    path('instructor/courses/<slug:slug>/students/', instructor_views.course_students, name='course_students'),
    path('instructor/courses/<slug:slug>/modules/add/', instructor_views.module_create, name='module_create'),
    path('instructor/modules/<int:module_id>/lessons/add/', instructor_views.lesson_create, name='lesson_create'),
    path('instructor/lessons/<int:lesson_id>/edit/', instructor_views.lesson_edit, name='lesson_edit'),
    path('instructor/lessons/<int:lesson_id>/delete/', instructor_views.lesson_delete, name='lesson_delete'),
    path('instructor/courses/<slug:slug>/delete/', instructor_views.course_delete, name='course_delete'),
    path('instructor/courses/<slug:slug>/toggle-publish/', instructor_views.course_toggle_publish, name='course_toggle_publish'),
    path('instructor/courses/<slug:slug>/students/<int:enrollment_id>/remove/', instructor_views.remove_student, name='remove_student'),
]