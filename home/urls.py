from django.urls import path, include
from . import views

urlpatterns = [
    path('', views.home, name="home"),
    path('licence/<int:pk>', views.licence, name="licence"),
    path('master/<int:pk>', views.master, name="master"),
    path('administration/index', views.admin_index, name="admin_index"),
    path('administration/creer/filiere', views.creer_filiere, name="admin.creer.filiere"),
    path('administration/ajouter/salle', views.ajouterSalle, name="admin.ajouter.salle"),
    path('administration/ajouter/semaine', views.ajouterSemaine, name="admin.ajouter.semaine"),
    path('administration/ajouter/matiere', views.ajouterMatiere, name="admin.ajouter.matiere"),
    path('administration/ajouter/enseignant', views.ajouterEnseignant, name="admin.ajouter.enseignant"),
    path('administration/ajouter/niveau', views.ajouterNiveau, name="admin.ajouter.niveau"),
    path('administration/ajouter/programme', views.ajouterProgramme, name="admin.ajouter.programme"),
    path('niveau/emploi/<int:pk>', views.niveau, name="emploi.niveau"),
]