from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, JsonResponse
from .models import *


def SectionPage(request, section_id):
    """ show section page """
    getSection= get_object_or_404(Section, id=section_id)
    getAllSections = Section.objects.select_related().all().values("id", "title")
    return render(request, 'section.html',{"getSection": getSection, "getAllSections": getAllSections})

def ContentPage(request, section_id, category_name, category_id, content_id):
    """ show content page """
    getContent= get_object_or_404(Content, id=content_id, category_id=category_id)
    getAllContents = Content.objects.all().filter(category_id=category_id).values("id", "title", "contentType")
    return render(request, 'content.html',{"getContent": getContent, 
                                           "getAllContents": getAllContents,
                                           "section_id": section_id,
                                           "category_name": category_name,
                                           "category_id": category_id
                                           })

def CategoryPage(request):
    """ show categories per section """

    # user.is_authenticated
    getSections = Section.objects.select_related().all()
  
    getCategories = Category.objects.select_related().all()
    # data_dict = model_to_dict(getSectios)

    print(getSections)

    # return render(request, 'home.html',{'getSections': getSections})
    return render(request, 'categories.html',{'getCategories': getCategories, "getSections": getSections})
