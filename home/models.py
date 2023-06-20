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
    



class Emplois(models.Model):
     Filiere=models.ForeignKey(Filiere,on_delete=models.CASCADE)
     annee=models.CharField(default="Annee",max_length=64)
     date=models.DateField(default=1/1/2000,verbose_name="date")
   
class Programme(models.Model):
    Filiere=models.ForeignKey(Filiere,on_delete=models.CASCADE)
    Cours=models.ForeignKey(Cours,on_delete=models.CASCADE)
    
    Salle=models.ForeignKey(Salle,on_delete=models.CASCADE)
    jour=models.CharField(max_length=15)
    heure_deb=models.CharField(max_length=15)
    heure_fin=models.CharField(max_length=15)
    

 

    

    
    



 