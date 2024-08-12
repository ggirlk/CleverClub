from django.contrib import admin, messages
from .models import Section, Category, Content, Enrolments, Exercices, ExerciceChoices, Pictures, UserProgress, UserExcerciceGrade
from django import forms
import re
import json
from django.conf import settings
import os
from cleverClub.utils import GenerateAnything
#from django_ckeditor_5.fields import CKEditor5Field
from .tasks import generate_contents
from django_rq import get_queue

@admin.register(Section)
class SectionAdmin(admin.ModelAdmin):
    pass

@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    # fields = ('title', 'level', 'tagId', 'pictureLink', 'shortDescription',"section", "longDescription", "admin", 'is_published')
    # # list_display = ('level',)
    # form = CategoryForm
    list_filter = ('section',)
    pass

class ContentForm(forms.ModelForm):
    generate = forms.BooleanField(required=False, help_text="Generate content using AI?")

    class Meta:
        model = Content
        fields = '__all__'

@admin.register(Content)
class ContentAdmin(admin.ModelAdmin):
    form = ContentForm
    form.base_fields['generate'].initial = False

    list_filter = ('category',)

    def save_model(self, request, obj, form, change):
        if obj.json == "" :
            obj.save()
         
        args = {
            "generate": form['generate'].value(),
            "obj": obj
        }
        queue = get_queue('default') 
        job = queue.enqueue(generate_contents, args, result_ttl=3600)
        """gem = GenerateAnything()
        # print(type(obj.json), obj.json)
        html, jsonContent = None, None
        try:
            if form['generate'].value() == True:

                prompt = gem.getPrompt(obj, obj.contentType)
                
                jsonContent = gem.callgemini(prompt)

                print("generated json", type(jsonContent), jsonContent)
  
                html, jsonContent = gem.jsonToHTML(jsonContent)        
                
            else:
                html, jsonContent = gem.jsonToHTML(obj.json)
               
            if html == None and jsonContent == None:
                return self.message_user(request, "Oops an error has occured!", level=messages.ERROR) 
            obj.json = json.dumps(jsonContent)
            obj.text = htmldefault
            obj.save() 
            # except json.JSONEncoderError as e:
            #     print(f"Error encoding JSON: {e}")
            # self.message_user(request, f"The content “{obj.__str__}” was changed successfully. You may edit it again below.", level=messages.SUCCESS)
        except Exception as e:
            raise
            print(f"Error: {e}")
            self.message_user(request, f'There was an error while saving please try again later! {str(e)}', level=messages.ERROR)
        """
        return self.message_user(request, f'Job has started check by id: {job.id}', )

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
