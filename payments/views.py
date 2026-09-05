import stripe
from django.conf import settings
from django.shortcuts import get_object_or_404, redirect, render
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.urls import reverse
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse, JsonResponse
from django.utils import timezone
from django.db import transaction
from courses.models import Course
from enrollments.models import Enrollment
from .models import Order


stripe.api_key = settings.STRIPE_SECRET_KEY


@login_required
def create_checkout_session(request, slug):
    course = get_object_or_404(Course, slug=slug, is_published=True)

    if course.is_free:
        messages.info(request, "This course is free — no payment needed.")
        return redirect('courses:course_detail', slug=slug)

    # Already enrolled? Don't let them pay twice.
    if Enrollment.objects.filter(student=request.user, course=course, is_active=True).exists():
        messages.info(request, "You're already enrolled in this course.")
        return redirect('courses:course_detail', slug=slug)

    # Create a pending Order first
    order = Order.objects.create(
        student=request.user,
        course=course,
        amount=course.price,
        currency='usd',
        status=Order.Status.PENDING,
    )

    success_url = request.build_absolute_uri(
        reverse('payments:payment_success')
    ) + f'?session_id={{CHECKOUT_SESSION_ID}}'
    cancel_url = request.build_absolute_uri(
        reverse('payments:payment_cancel')
    )

    checkout_session = stripe.checkout.Session.create(
        payment_method_types=['card'],
        line_items=[{
            'price_data': {
                'currency': order.currency,
                'product_data': {
                    'name': course.title,
                    'description': course.short_description or course.title,
                },
                'unit_amount': int(course.price * 100),
            },
            'quantity': 1,
        }],
        mode='payment',
        success_url=success_url,
        cancel_url=cancel_url,
        customer_email=request.user.email,
        metadata={
            'order_id': str(order.id),
            'course_id': str(course.id),
            'student_id': str(request.user.id),
        },
    )

    order.stripe_checkout_session_id = checkout_session.id
    order.save(update_fields=['stripe_checkout_session_id'])

    return redirect(checkout_session.url, permanent=False)


@login_required
def payment_success(request):
    session_id = request.GET.get('session_id')
    if not session_id:
        messages.error(request, "Missing session ID.")
        return redirect('courses:course_list')
    
    try:
        order = get_object_or_404(Order, stripe_checkout_session_id=session_id, student=request.user)
        
        # Safety net: if webhook hasn't arrived yet, process it now
        if order.status != Order.Status.PAID:
            session = stripe.checkout.Session.retrieve(session_id)
            if session.payment_status == 'paid':
                _fulfill_order(session.to_dict())
                order.refresh_from_db()
                messages.success(request, "Payment successful! You now have access to the course.")
        
        return render(request, 'payments/success.html', {'order': order})
        
    except stripe.error.StripeError as e:
        messages.error(request, f"Error verifying payment: {str(e)}")
        return redirect('courses:course_list')


@login_required
def payment_cancel(request):
    return render(request, 'payments/cancel.html')


@login_required
def order_history(request):
    """View order history for the logged-in user"""
    orders = Order.objects.filter(
        student=request.user
    ).select_related('course').order_by('-created_at')
    return render(request, 'payments/order_history.html', {'orders': orders})


@csrf_exempt
def stripe_webhook(request):
    payload = request.body
    sig_header = request.META.get('HTTP_STRIPE_SIGNATURE')
    endpoint_secret = settings.STRIPE_WEBHOOK_SECRET

    print("🔔 Webhook received!")

    try:
        event = stripe.Webhook.construct_event(payload, sig_header, endpoint_secret)
    except ValueError:
        print("❌ Invalid payload")
        return HttpResponse(status=400)
    except stripe.error.SignatureVerificationError:
        print("❌ Invalid signature")
        return HttpResponse(status=400)

    print(f"📦 Event type: {event['type']}")

    if event['type'] == 'checkout.session.completed':
        session = event['data']['object']
        _fulfill_order(session.to_dict())

    elif event['type'] == 'checkout.session.expired':
        session = event['data']['object']
        _mark_order_failed(session.to_dict())

    return HttpResponse(status=200)


def _fulfill_order(session_dict):
    """Called when Stripe confirms payment succeeded."""
    order_id = session_dict.get('metadata', {}).get('order_id')
    if not order_id:
        print("❌ No order_id in metadata")
        return

    try:
        order = Order.objects.select_related('student', 'course').get(id=order_id)
    except Order.DoesNotExist:
        print(f"❌ Order {order_id} NOT FOUND!")
        return

    if order.status == Order.Status.PAID:
        print(f"ℹ️ Order {order_id} already processed (idempotent)")
        return

    with transaction.atomic():
        order.status = Order.Status.PAID
        order.stripe_payment_intent_id = session_dict.get('payment_intent', '')
        order.paid_at = timezone.now()
        order.save(update_fields=['status', 'stripe_payment_intent_id', 'paid_at'])
        print(f"✅ Order {order_id} updated to PAID")

        enrollment, created = Enrollment.objects.get_or_create(
            student=order.student,
            course=order.course,
            defaults={'is_active': True}
        )
        
        if created:
            print(f"✅ New enrollment created for {order.student.username}")
        else:
            enrollment.is_active = True
            enrollment.save()
            print(f"✅ Existing enrollment activated for {order.student.username}")

        print(f"🎉 SUCCESS: Order {order_id} paid and student enrolled!")


def _mark_order_failed(session_dict):
    """Mark order as failed when checkout expires"""
    order_id = session_dict.get('metadata', {}).get('order_id')
    if not order_id:
        return
    
    updated = Order.objects.filter(
        id=order_id, 
        status=Order.Status.PENDING
    ).update(status=Order.Status.FAILED)
    
    if updated:
        print(f"❌ Order {order_id} marked as FAILED")


# Temporary test webhook endpoint
@csrf_exempt
def test_webhook(request):
    print("🔔🔔🔔 TEST WEBHOOK CALLED!")
    print(f"Request body: {request.body[:200]}")
    return JsonResponse({"status": "ok", "method": request.method})

