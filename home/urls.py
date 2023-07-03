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

    path('administration/liste/semaines', views.listeSemaines, name="admin.liste.semaine"),
    path('administration/modifier/semaines/<int:semaine_id>', views.modifierSemaine, name="admin.modifier.semaine"),
    path('administration/delete/semaines/<int:semaine_id>', views.deleteSemaine, name="admin.delete.semaine"),

    path('administration/ajouter/matiere', views.ajouterMatiere, name="admin.ajouter.matiere"),
    path('administration/ajouter/enseignant', views.ajouterEnseignant, name="admin.ajouter.enseignant"),
    path('administration/ajouter/niveau', views.ajouterNiveau, name="admin.ajouter.niveau"),
    path('administration/ajouter/programme', views.ajouterProgramme, name="admin.ajouter.programme"),
    path('administration/ajouter/programme/semaine/<int:pk>', views.ajouterProgramme, name="admin.ajouter.programme"),
    path('niveau/emploi/<int:pk>', views.affichageEmploi, name="emploi.niveau"),
    path('administration/delete/<int:programme_id>', views.deleteProgramme, name="programme.delete"),
    path('administration/ajouter/communique', views.ajouter_communique, name="ajouter.communique"),

    path('administration/list/matiere', views.listeMatiere, name="admin.list.matiere"),
    path('administration/modifier/amtiere/<int:pk>', views.modifierMatiere, name="admin.modifier.matiere"),
    path('administration/matiere/delete/<int:matiere_pk>', views.deleteMatiere, name="admin.matiere.delete"),

    path('administration/enseignant/horaire/<int:enseignant_pk>', views.masseHoraire, name="admin.enseignant.horaire"),

]