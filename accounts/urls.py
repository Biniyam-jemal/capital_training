# accounts/urls.py
from django.urls import path
from django.contrib.auth import views as auth_views
from . import views

app_name = 'accounts'

urlpatterns = [
    path('register/', views.register, name='register'),
    path('login/', auth_views.LoginView.as_view(template_name='accounts/login.html'), name='login'),
    path('logout/', auth_views.LogoutView.as_view(next_page='courses:home'), name='logout'),
    path('dashboard/', views.dashboard, name='dashboard'),
    path('student-view/', views.student_view, name='student_view'),
    path('become-instructor/', views.become_instructor, name='become_instructor'),
    path('profile/', views.profile, name='profile'),
]