from django.urls import path, include
from . import views

urlpatterns = [
    path('', views.home, name="home"),
    path('licence/<int:pk>', views.licence, name="licence"),
    path('master/<int:pk>', views.master, name="master"),
    path('administration/index', views.admin_index, name="admin_index"),
    path('administration/creer/filiere', views.creer_filiere, name="admin.creer.filiere"),
]