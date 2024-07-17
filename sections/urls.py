from django.urls import path
from . import views

app_name="sections"

urlpatterns = [
    # path('studio', views.studio, name='studio'),
    path('categories', views.CategoryPage, name='categories'),
   
]