from django.db import models
from django.conf import settings
from cleverClub.utils import GenerateAnything
from django.utils.translation import gettext_lazy as _

from django_ckeditor_5.fields import CKEditor5Field


class Section(models.Model) :
    title = models.CharField(max_length=30)
    picture = models.ImageField(upload_to='imgs/uploads/sections/%Y/')
    tagId = models.CharField(max_length=30)
    description = models.TextField()
     # who created it
    admin = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='admin_section', on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    is_published = models.BooleanField(default=False)

    def __str__(self):
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
    
    def __str__(self):
        return f"{self.title} ,{self.updated_at}"

class Content(models.Model) :
    TYPES = (
        ('Course', 'Course'),
        ('Puzzle', 'Puzzle'),
        ('Story', 'Story'),
        ('Manga', 'Manga'),
    )
    LEVELS = (
        ('Beginner', _('Beginner')),
        ('Medium', _('Medium')),
        ('Advanced', _('Advanced')),
    )
    title =  models.CharField(max_length=30)
    contentType = models.CharField(max_length=30, verbose_name="Content Type", choices=TYPES, default="Course")
    contentFile =  models.CharField(max_length=30)
    description =  models.TextField()
    section = models.ForeignKey("Section", on_delete=models.CASCADE)
    category = models.ForeignKey("Category", on_delete=models.CASCADE)
    admin = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='admin_content', on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    pictures = models.ForeignKey("Pictures", on_delete=models.CASCADE, null=True)
    level = models.CharField(max_length=30, choices=LEVELS)
    text = CKEditor5Field(blank=True,null=True)
    is_published = models.BooleanField(default=False, verbose_name="Publish Content?")

    def fillContents(self, prompt):
        """ Generate content"""
        gem = GenerateAnything()
        return gem.callgemini(prompt)

    def __str__(self):
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
    section = models.ForeignKey("Section", on_delete=models.CASCADE)
    category = models.ForeignKey("Category", on_delete=models.CASCADE, null=True)
    content = models.ForeignKey("Content", on_delete=models.CASCADE, null=True)

    admin = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='admin_exercice', on_delete=models.CASCADE)
    level = models.CharField(max_length=30, choices=LEVELS)
    choices = models.ForeignKey("ExerciceChoices", on_delete=models.CASCADE, null=True)
    answer = models.CharField(max_length=2048)
    pictures = models.ForeignKey("Pictures", on_delete=models.CASCADE, null=True)
    is_published = models.BooleanField(default=False)
    
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class ExerciceChoices(models.Model):
    choice = models.CharField(max_length=512)
    answer = models.CharField(max_length=512) # True / False or Text
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

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
    section = models.ForeignKey("Section", on_delete=models.CASCADE)
    category = models.ForeignKey("Category", on_delete=models.CASCADE)
    content = models.ForeignKey("Content", on_delete=models.CASCADE)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='user_progress', on_delete=models.CASCADE)
    page = models.CharField(max_length=30)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class UserExcerciceGrade(models.Model) :
    user = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='user_grade', on_delete=models.CASCADE)
    exercice = models.ForeignKey("Exercices", on_delete=models.CASCADE)
    trial = models.IntegerField()
    grade = models.DecimalField(max_digits=3, decimal_places=3)

    