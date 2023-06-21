from django.db import models

class Filiere(models.Model):
    name=models.CharField(max_length=64)

class Salle(models.Model):
    nom_Salle=models.CharField(max_length=20)    
    capacite_Salle=models.IntegerField()
    


class Cours(models.Model):
    nom_cours=models.CharField(max_length=64)
   
   
class classes(models.Model):
    nom_classes=models.CharField(max_length=64)
    



class Enseignants(models.Model):
     nom_Enseignant=models.CharField(max_length=64)
     email_Enseignant=models.CharField(max_length=50)
     
class Semaine(models.Model):
    nom_semaine=models.CharField(max_length=64)
   
class Programme(models.Model):
    Filiere=models.CharField(max_length=64)
    Cours=models.CharField(max_length=64)
    Salle=models.CharField(max_length=64)
    jour=models.CharField(max_length=15)
    heure_deb=models.CharField(max_length=15)
    heure_fin=models.CharField(max_length=15)
    annee=models.CharField(max_length=17,default=1)
    Enseignants=models.CharField(max_length=64)
    Semaine=models.CharField(max_length=64)
    

 

    

    
    



 