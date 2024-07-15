from django.urls import path
from . import views

app_name="musicStudio"

urlpatterns = [
    path('studio', views.studio, name='studio'),
    path('native', views.native, name='native'),
    path('generateMusic', views.callgemini, name='generate.music'),
]