from django.urls import path
from django.contrib.auth.decorators import login_required

from . import views

app_name="musicStudio"

urlpatterns = [
    path('studio', login_required(views.studio), name='studio'),
    path('native', views.native, name='native'),
    path('generateMusic',login_required(views.generateMusic), name='generate.music'),
    path('studio/getSelectedTones/<int:generated_id>/', login_required(views.getSelectedTones), name='getSelectedTones'),
    path('create_music', login_required(views.create_music), name='create_music'),
    path('task_status/<str:job_id>/', login_required(views.get_task_status), name='task_status'),
] 