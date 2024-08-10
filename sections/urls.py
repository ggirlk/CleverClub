from django.urls import path
from . import views
from django.contrib.auth.decorators import login_required

app_name="sections"

urlpatterns = [
    path('section/<int:section_id>/', views.SectionPage, name='section'),
    path('section/<int:section_id>/<str:category_name>/<int:category_id>/content/<int:content_id>/', views.ContentPage, name='content'),
    path('categories', views.CategoryPage, name='categories'),
   
]