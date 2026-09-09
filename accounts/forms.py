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


class InstructorApplicationForm(forms.Form):
    instructor_bio = forms.CharField(
        widget=forms.Textarea(attrs={'rows': 5, 'class': 'form-control'}),
        label="Tell us about your teaching experience and what you'd like to teach",
        max_length=1000,
    )
    instructor_portfolio_url = forms.URLField(
        required=True,
        widget=forms.URLInput(attrs={'class': 'form-control', 'placeholder': 'https://github.com/yourusername'}),
        label="GitHub or portfolio link",
        help_text="A link where we can see your work or professional background.",
    )
    instructor_teaching_url = forms.URLField(
        required=False,
        widget=forms.URLInput(attrs={'class': 'form-control', 'placeholder': 'https://udemy.com/user/yourname (optional)'}),
        label="Udemy / YouTube / other teaching profile",
        help_text="Optional — link to any platform where you've taught before.",
    )
    instructor_credentials_url = forms.URLField(
        required=True,
        widget=forms.URLInput(attrs={'class': 'form-control', 'placeholder': 'https://drive.google.com/... or https://linkedin.com/in/yourname'}),
        label="Resume, CV, or certificate link",
        help_text="Share a link (Google Drive, Dropbox, LinkedIn, etc.) — no file upload needed.",
    )
class ProfileForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'email', 'phone_number', 'bio', 'profile_picture']
        widgets = {
            'bio': forms.Textarea(attrs={'rows': 4, 'placeholder': 'Tell us a bit about yourself...'}),
        }