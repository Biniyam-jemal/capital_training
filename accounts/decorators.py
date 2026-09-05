from functools import wraps
from django.contrib.auth.decorators import login_required
from django.core.exceptions import PermissionDenied


def instructor_required(view_func):
    @wraps(view_func)
    @login_required
    def wrapper(request, *args, **kwargs):
        if request.user.role != request.user.Role.INSTRUCTOR:
            raise PermissionDenied("You must be an instructor to access this page.")
        return view_func(request, *args, **kwargs)
    return wrapper