from django.contrib import admin
from .models import Filiere, Salle, Cours, classes, Enseignants, Semaine, Programme

@admin.register(Filiere)
class FiliereAdmin(admin.ModelAdmin):
    list_display = ('name',)
    search_fields = ('name',)

@admin.register(Salle)
class SalleAdmin(admin.ModelAdmin):
    list_display = ('nom_Salle', 'capacite_Salle')
    list_filter = ('capacite_Salle',)
    search_fields = ('nom_Salle',)

@admin.register(Cours)
class CoursAdmin(admin.ModelAdmin):
    list_display = ('nom_cours',)
    search_fields = ('nom_cours',)

@admin.register(classes)
class ClassesAdmin(admin.ModelAdmin):
    list_display = ('nom_classes',)
    search_fields = ('nom_classes',)

@admin.register(Enseignants)
class EmploisAdmin(admin.ModelAdmin):
    list_display = ('nom_Enseignant', 'email_Enseignant')
    search_fields = ('nom_Enseignant', 'email_Enseignant')

@admin.register(Programme)
class ProgrammeAdmin(admin.ModelAdmin):
    list_display = ('Filiere', 'Cours', 'Salle', 'jour', 'heure_deb', 'heure_fin')
    list_filter = ('Filiere', 'Cours', 'Salle', 'jour')
    search_fields = ('Filiere__name', 'Cours__nom_cours', 'Salle__nom_Salle')
