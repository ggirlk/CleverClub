from django.urls import path
from . import views


urlpatterns = [
    path('rq_status/<str:job_id>', views.rq_status_view, name="job_status")
]