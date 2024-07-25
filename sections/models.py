from django.db import models
from django.conf import settings
# from cleverClub.utils import GenerateAnything
from django.utils.translation import gettext_lazy as _

from django_ckeditor_5.fields import CKEditor5Field


class Section(models.Model) :
    title = models.CharField(max_length=30)
    picture = models.ImageField(upload_to='imgs/uploads/sections/%Y/')
    tagId = models.CharField(max_length=30)
    description = models.TextField()
    # admin who created it
    admin = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='admin_section', on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    is_published = models.BooleanField(default=False)

    class Meta:
        ordering = ["id"]
    
    def categories(self):
        """ return related """
        return self.category_set.all()

    def __str__(self):
        if len(self.categories()) > 0: # so that we don't have value issues when adding
            categories = self.categories() # get related
        return f"{self.title}, {self.updated_at}"


class Category(models.Model) :

    title =  models.CharField(max_length=100)
    # tagId = models.CharField(max_length=30)
    # picture =  models.ImageField(upload_to='imgs/uploads/categories/%Y/')
    description =  models.TextField()
    section = models.ForeignKey("Section", on_delete=models.CASCADE)
    admin = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='admin_category', on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    is_published = models.BooleanField(default=False)

    class Meta:
        ordering = ["id"]

    def contents(self):
        return self.content_set.all()
    
    def __str__(self):
        if len(self.contents()) > 0:
            contents = self.contents()
        return f"{self.section.title}: {self.title}"# ,{self.updated_at}"

class Content(models.Model) :
    TYPES = (
        ('Course', _('Course')),
        ('Puzzle', _('Puzzle')),
        ('Story', _('Story')),
        ('Manga', _('Manga')),
    )
    LEVELS = (
        ('Beginner', _('Beginner')),
        ('Medium', _('Medium')),
        ('Advanced', _('Advanced')),
    )
    # help(CKEditor5Field)
    title =  models.CharField(max_length=30)
    contentType = models.CharField(max_length=30, verbose_name="Content Type", choices=TYPES, default="Course")
    description =  models.TextField()
    # section = models.ForeignKey("Section", on_delete=models.CASCADE)
    category = models.ForeignKey("Category", on_delete=models.CASCADE)
    admin = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='admin_content', on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    pictures = models.ForeignKey("Pictures", on_delete=models.CASCADE, null=True, blank=True)
    level = models.CharField(max_length=30, choices=LEVELS)
    text = CKEditor5Field(blank=True,null=True, verbose_name="Content (if you want to edit a Puzzle only the json works!)", config_name='admin')
    json = models.TextField(blank=True,null=True)
    is_published = models.BooleanField(default=False, verbose_name="Publish Content?")
    
    class Meta:
        ordering = ["id"]

    def exercices(self):
        return self.exercices_set.all()
    
    def __str__(self):
        # help(CKEditor5Field)
        if len(self.exercices()) > 0:
            exercices = self.exercices()
        return f"{self.title}, {self.updated_at}"


class Enrolments(models.Model) :
    content = models.ForeignKey("Content", on_delete=models.CASCADE)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='user_enrolment', on_delete=models.CASCADE)
    
    enrolled_at = models.DateTimeField(auto_now_add=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.user.first_name}, {self.user.last_name} {self.updated_at}"
    

class Exercices(models.Model):
    # if it's related to content it follows else we chose the level
    LEVELS = (
        ('Beginner', _('Beginner')),
        ('Medium', _('Medium')),
        ('Advanced', _('Advanced')),
    ) 
    name = models.CharField(max_length=30, default="Exercice") # exce number + name
    content = models.ForeignKey("Content", on_delete=models.CASCADE, null=True) # the exercice can belong to a content or can be general

    admin = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='admin_exercice', on_delete=models.CASCADE)
    level = models.CharField(max_length=30, choices=LEVELS, null=True)
    question = models.TextField(null=True)
    answer = models.TextField(null=True)
    pictures = models.ForeignKey("Pictures", on_delete=models.CASCADE, null=True)
    is_published = models.BooleanField(default=False)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ["name"]

    def choices(self):
        return self.exercicechoices_set.all()
    
    def __str__(self):
        if len(self.choices()) > 0:
            choices = self.choices()
        return f"{self.name}"


class ExerciceChoices(models.Model):
    exercice = models.ForeignKey("Exercices", on_delete=models.CASCADE, null=True) 
    name = models.CharField(max_length=30, null=True)
    choice = models.TextField(null=True)
    answer = models.TextField(null=True) # True / False or Text

    picture = models.ForeignKey("Exercices", related_name='exercice_picture', on_delete=models.CASCADE, null=True) # a choice
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.choice}"


class Pictures(models.Model):
    TYPES = (
        ('Exercice', 'Exercice'),
        ('Content', 'Content'),
    )
    title = models.CharField(max_length=30)
    pictureType = models.CharField(max_length=100, choices=TYPES)
    picture = models.ImageField(upload_to='imgs/uploads/contents/%Y/')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)    

class UserProgress(models.Model) :
    content = models.ForeignKey("Content", on_delete=models.CASCADE)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='user_progress', on_delete=models.CASCADE)
    done = models.BooleanField(default=False)
    page = models.CharField(max_length=30) # link to the page
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class UserExcerciceGrade(models.Model) :
    user = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='user_grade', on_delete=models.CASCADE)
    exercice = models.ForeignKey("Exercices", on_delete=models.CASCADE)
    done = models.BooleanField(default=False)
    trial = models.IntegerField()
    grade = models.DecimalField(max_digits=3, decimal_places=3)


