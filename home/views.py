from django.shortcuts import render

from django.forms.models import model_to_dict

from sections.models import *

def home(request):
    # user.is_authenticated
    getSections = Section.objects.all() 
    # data_dict = model_to_dict(getSectios)

    print(getSections)
    return render(request, 'home.html',{'getSections': getSections})