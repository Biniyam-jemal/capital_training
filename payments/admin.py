# payments/admin.py
from django.contrib import admin
from .models import Order

@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    list_display = ('id', 'student', 'course', 'amount', 'status', 'created_at', 'paid_at')
    list_filter = ('status',)
    search_fields = ('student__username', 'course__title', 'stripe_checkout_session_id')
    readonly_fields = ('id', 'stripe_checkout_session_id', 'stripe_payment_intent_id', 'created_at', 'paid_at')