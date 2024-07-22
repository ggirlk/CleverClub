from django.http import Http404
from django.shortcuts import render

def trigger_404(request):
    raise Http404("This is a test 404 error")
