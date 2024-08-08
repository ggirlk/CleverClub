from django.contrib import admin
from .models import *
from .forms import *

@admin.register(GeneratedMusic)
class GeneratedMusicAdmin(admin.ModelAdmin):
    form = GenerateMusicForm
    fields = ['title', 'style', 'key', 'tempo', 'timeSignature', 'feel', 'rhythm','maxOffset', 'fullDurationInSeconds', 'jsonContents']

