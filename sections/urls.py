from django.urls import path
from . import views

app_name="sections"

urlpatterns = [
    # path('studio', views.studio, name='studio'),
    path('section/<int:section_id>/', views.SectionPage, name='section'),
    path('categories', views.CategoryPage, name='categories'),
   
]