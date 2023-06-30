from django.db import models
from datetime import date

class Filiere(models.Model):
    name=models.CharField(max_length=64)

class Salle(models.Model):
    nom_Salle=models.CharField(max_length=20)    
    capacite_Salle=models.IntegerField()
    
   
class classes(models.Model):
    nom_classes=models.CharField(max_length=64)

class Semaine(models.Model):
    nemuro_semaine = models.IntegerField()
    annee_scolaire = models.CharField(max_length=25)
    date_debut = models.DateField(null=True)
    date_fin = models.DateField(null=True)
    publich = models.BooleanField(default=False)


    

class Emplois(models.Model):
     Filiere=models.ForeignKey(Filiere,on_delete=models.CASCADE)
     annee=models.CharField(default="Annee",max_length=64)
     date=models.DateField(default=1/1/2000,verbose_name="date")

class Niveau(models.Model):
    nom=models.CharField(max_length=20)
 
class Cours(models.Model):
    nom_cours=models.CharField(max_length=64) 
    niveau = models.ForeignKey(Niveau, on_delete=models.CASCADE, null=True)
    filiere = models.ForeignKey(Filiere, on_delete=models.CASCADE, null=True)

class Enseignant(models.Model):
    nom = models.CharField(max_length=50)
    prenom = models.CharField(max_length=50)
    contact = models.CharField(max_length=50)
    filiere = models.ForeignKey(Filiere, on_delete=models.CASCADE)
   
class Programme(models.Model):
    cours=models.ForeignKey(Cours,on_delete=models.CASCADE,  null=True)
    niveau=models.ForeignKey(Niveau,on_delete=models.CASCADE,  null=True)
    semaine=models.ForeignKey(Semaine,on_delete=models.CASCADE,  null=True)
    enseignant = models.ForeignKey(Enseignant, on_delete=models.CASCADE, null=True)

    
    salle=models.ForeignKey(Salle,on_delete=models.CASCADE)
    jour=models.CharField(default = 'Lundi', max_length=20)
    heure_deb=models.IntegerField()
    heure_fin=models.IntegerField()
    heure_fin=models.DateField(auto_now=True)

    filieres = models.ManyToManyField(Filiere)


    
    



 