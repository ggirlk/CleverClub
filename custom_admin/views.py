from django.shortcuts import render
from django.contrib import admin
from django.http import JsonResponse
from django.urls import path
from django_rq import get_queue


def rq_status_view(request, job_id):
    queue = get_queue('default')
    job = queue.fetch_job(job_id)
    if job != None:
        result = job.result if job.is_finished else None
    else:
        result = None

    context = {
        'job': job,
        'result': result, 
    }
    return render(request, 'task_status.html', context)

