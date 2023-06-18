from django.db import models

class Filiere(models.Model):
    name=models.CharField(max_Length=64)

class Cours(models.Model):
    nom_cours=models.CharField(max_Length=64)
    Filiere=models.ForeignKey(Filiere,on_delete=models.cascade)
    Licence=models.ForeignKey(Licence,on_delete=models.cascade)

class Enseignants(models.Model):
    nom_Enseignant=models.CharField(max_Length=64)
    mail_Enseignants=models.EmailField()
    tel_Enseignants=models.CharField(18)

class Etudiants(models.Model):
    nom_Etudiants=models.CharField(max_Length=64)
    mail_Etudiants=models.EmailField()
    tel_Etudiants=models.CharField(max_Length=18)
    Filiere=models.ForeignKey(Filiere,on_delete=models.cascade)

class Emplois(models.Model):
    Filiere=models.ForeignKey(Filiere,on_delete=models.cascade)
    Cours=models.ForeignKey(Cours,on_delete=models.cascade)
    Enseignants=models.ForeignKey(Enseignants,on_delete=models.cascade)
    Salle=models.ForeignKey(Salle,on_delete=models.cascade)
    Licence=models.ForeignKey(Licence,on_delete=models.cascade)
    jour=models.CharField(max_Length=15)
    heure_deb=models.CharField(max_Length=15)
    heure_fin=models.CharField(max_Length=15)

class Salle(models.Model):
    nom_Salle=models.CharField(max_Length=20)    
    capacite_Salle=models.IntegerField()
    
class Licence(models.Model):
    nom_Licence=models.CharField(25)
       
class Master(models.Model):
    nom_Master=models.CharField(25)

    
    



