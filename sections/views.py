from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, JsonResponse
from .models import *

def SectionPage(request, section_id):
    """ show section page  get_object_or_404"""
    getSection= get_object_or_404(Section, id=section_id)
    #getSection = Section.objects.select_related().get(id=2)
    return render(request, 'section.html',{"getSection": getSection})

def CategoryPage(request):
    """ show categories per section """

    # user.is_authenticated
    getSections = Section.objects.select_related().all()
    for s in getSections:
        # print(s.category_set.all())
        print("view", s.__dict__)
    getCategories = Category.objects.select_related().all()
    # data_dict = model_to_dict(getSectios)

    print(getSections)

    # return render(request, 'home.html',{'getSections': getSections})
    return render(request, 'categories.html',{'getCategories': getCategories, "getSections": getSections})
