from django.shortcuts import render

from django.forms.models import model_to_dict

from sections.models import *

def home(request):
    # user.is_authenticated
    if request.user.is_staff:
        getSections = Section.objects.all()
    else:
        getSections = Section.objects.all().filter(is_published=True)

    # data_dict = model_to_dict(getSectios)

    print(getSections)
    return render(request, 'home.html',{'getSections': getSections})