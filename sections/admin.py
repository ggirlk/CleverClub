from django.contrib import admin
from .models import Section, Category, Content, Enrolments, Exercices, ExerciceChoices, Pictures, UserProgress, UserExcerciceGrade
from django import forms


@admin.register(Section)
class SectionAdmin(admin.ModelAdmin):
    pass

@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    # fields = ('title', 'level', 'tagId', 'pictureLink', 'shortDescription',"section", "longDescription", "admin", 'is_published')
    # # list_display = ('level',)
    # form = CategoryForm
    pass

@admin.register(Content)
class ContentAdmin(admin.ModelAdmin):
    def save_model(self, request, obj, form, change):
        prompt =""" 
                    {
                    "description": "Generate a """+ obj.contentType +""" that follows the prompt details, the course can contain images, links code sections, any specialchars or symbols",
                    "prompt_details": {
                        "Section": """+ obj.section.title  +""",
                        "Category": """+ obj.category.title  +""",
                        "description": """+ obj.description +"""
                        "level": """+ obj.level  +""",
                        "length": "Medium",
                        "audience": "kids and teenagers",
                        "output_format": "html"
                    }
                    }
                 """
        #if not obj.text:
        obj.text = obj.fillContents(prompt)
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
