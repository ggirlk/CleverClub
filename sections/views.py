from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, JsonResponse
from .models import *
from django.db.models import Prefetch

def SectionPage(request, section_id):
    """ show section page """
    if request.user.is_staff:
        getSection= get_object_or_404(Section, id=section_id)
        #getCategories = getSection.categories()
        getAllSections = Section.objects.select_related().all().values("id", "title")
    else:
        getSection= get_object_or_404(Section, id=section_id, is_published=True)
        #getCategories = getSection.categories(is_published=True)
        getAllSections = Section.objects.select_related().all().filter(is_published=True).values("id", "title")
    
    return render(request, 'section.html',{"getSection": getSection, "getAllSections": getAllSections})

def ContentPage(request, section_id, category_name, category_id, content_id):
    """ show content page """
    if request.user.is_staff:
        getContent= get_object_or_404(Content, id=content_id, category_id=category_id)
        getAllContents = Content.objects.all().filter(category_id=category_id).values("id", "title", "contentType")
    else:
        getContent= get_object_or_404(Content, id=content_id, category_id=category_id, is_published=True)
        getAllContents = Content.objects.all().filter(category_id=category_id, is_published=True).values("id", "title", "contentType")
    return render(request, 'content.html',{"getContent": getContent, 
                                           "getAllContents": getAllContents,
                                           "section_id": section_id,
                                           "category_name": category_name,
                                           "category_id": category_id
                                           })

def CategoryPage(request):
    """ show categories per section """
    if request.user.is_staff:
        # user.is_authenticated
        getSections = Section.objects.select_related().all()
    
        getCategories = Category.objects.select_related().all()
        # data_dict = model_to_dict(getSectios)
    else:
        published_categories = Category.objects.filter(is_published=True)
        getSections = Section.objects.prefetch_related(
            Prefetch('Category', queryset=published_categories)
        )

        published_contents = Content.objects.filter(is_published=True)
        getCategories = Category.objects.prefetch_related(
            Prefetch('Content', queryset=published_contents)
        )

    print(getSections)

    # return render(request, 'home.html',{'getSections': getSections})
    return render(request, 'categories.html',{'getCategories': getCategories, "getSections": getSections})
