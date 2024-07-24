from django.contrib import admin
from .models import Section, Category, Content, Enrolments, Exercices, ExerciceChoices, Pictures, UserProgress, UserExcerciceGrade
from django import forms
import re
import json
from django.conf import settings
import os
from cleverClub.utils import GenerateAnything


@admin.register(Section)
class SectionAdmin(admin.ModelAdmin):
    pass

@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    # fields = ('title', 'level', 'tagId', 'pictureLink', 'shortDescription',"section", "longDescription", "admin", 'is_published')
    # # list_display = ('level',)
    # form = CategoryForm
    pass

class ContentForm(forms.ModelForm):
    generate = forms.BooleanField(required=False, help_text="Generate content using AI?") # try to add a fied to the form

    class Meta:
        model = Content
        fields = '__all__'

@admin.register(Content)
class ContentAdmin(admin.ModelAdmin):
    form = ContentForm
    form.base_fields['generate'].initial = False
    #form = Content 

    def save_model(self, request, obj, form, change):
        try:
            if obj.text == "<p>&nbsp;</p>" or form['generate'].value() == True:
                gem = GenerateAnything()

                prompt = gem.getPrompt(obj, obj.contentType)
                
                jsonContent = gem.callgemini(prompt)

                print("generated json", jsonContent)
  
                html = ""
                if (type(jsonContent) == str):
                    jsonContent = json.loads(jsonContent)
                keys = list(jsonContent.keys())
                if keys[0] != "tags":
                    jsonContent = jsonContent[keys[0]]
                if "tags" in keys:
                    jsonContent = jsonContent["tags"]
                obj.json = jsonContent
                # print(jsonContent)
                for elem in jsonContent: # make this a stand alone function in utils
                    print(elem)
                    # print(elem['tag'], elem['innerText'], type(elem['innerText']))
                    if type(elem['innerText']) == str:
                        html += "<"+elem['tag']
                        for attribute in list(elem.keys()):
                            if attribute != 'innerText':
                                html += " "+attribute+"="+elem[attribute]
                        html += ">"+elem['innerText']+"</"+elem['tag']+">"

                    if type(elem['innerText']) == list:
                        for li in elem['innerText']:
                            html += "<"+li['tag']+">"+li['innerText']+"</"+li['tag']+">"
                obj.text = html  
                print("html", html)
        except:
            raise
                
        obj.save()
   
@admin.register(Enrolments)
class EnrolmentsAdmin(admin.ModelAdmin):
    pass

# class ExercicesForm(forms.ModelForm):
#     LEVELS = (
#         ('Beginner', 'Beginner'),
#         ('Medium', 'Medium'),
#         ('Advanced', 'Advanced'),
#     )
    
#     level = forms.ChoiceField(choices=LEVELS)


@admin.register(Exercices)
class ExercicesAdmin(admin.ModelAdmin):
    # form = ExercicesForm
    pass

@admin.register(ExerciceChoices)
class ExerciceChoicesAdmin(admin.ModelAdmin):
    pass

# class PicturesForm(forms.ModelForm):
#     TYPES = (
#         ('Exercice', 'Exercice'),
#         ('Content', 'Content'),
#     )
    
#     pictureSource = forms.ChoiceField(choices=TYPES)

@admin.register(Pictures)
class PicturesAdmin(admin.ModelAdmin):
    # form = PicturesForm
    pass

@admin.register(UserProgress)
class UserProgressAdmin(admin.ModelAdmin):
    pass

@admin.register(UserExcerciceGrade)
class UserExcerciceGradeAdmin(admin.ModelAdmin):
    pass
