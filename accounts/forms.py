# accounts/forms.py
from django import forms
from django.contrib.auth.forms import UserCreationForm
from .models import User


class StudentRegistrationForm(UserCreationForm):
    email = forms.EmailField(required=True)

    class Meta:
        model = User
        fields = ('username', 'email', 'password1', 'password2')

    def save(self, commit=True):
        user = super().save(commit=False)
        user.email = self.cleaned_data['email']
        user.role = User.Role.STUDENT   # public registration always creates students
        if commit:
            user.save()
        return user
from django import forms
from .models import User

class InstructorApplicationForm(forms.Form):
    instructor_bio = forms.CharField(
        widget=forms.Textarea(attrs={'rows': 5}),
        label="Tell us about your teaching experience and what you'd like to teach",
        max_length=1000,
    )