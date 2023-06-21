from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from .models import Programme
from django.views import View

# Create your views here.

@login_required()
def home(request):

    context = {}

    return render(request, 'home/default.html', context)
    

@login_required()
def licence(request, pk):

    context = {
        'classe': f"Licence {pk}"
    }

    return render(request, 'home/licence.html', context)
    
@login_required()
def master(request, pk):

    context = {
        'classe': f"Master {pk}"
    }

    return render(request, 'home/master.html', context)

@login_required()
def admin_index(request):
    if request.method == 'POST':
        annee = request.POST["classe"]
        fil = request.POST['Filiere']
        sem = request.POST['ss']
        
        #premier cours Lundi
        hor = request.POST['ptl']
        nc = request.POST['pc1']
        pro =request.POST['pf1']
        sal =request.POST['ps1']
        
        if hor and nc and pro and sal:
            mettre = Programme.objects.create(jour='Lundi',heure_deb=hor,heure_fin=hor,Cours=nc ,Enseignants=pro,Semaine=sem,Filiere=fil,Salle=sal,annee=annee)
        
        
        #deuxieme cours Lundi
        hor = request.POST['pd1']
        nc = request.POST['pdc1']
        pro =request.POST['pfs1']
        sal =request.POST['pss1']
        if hor and nc and pro and sal:
            mettre = Programme.objects.create(jour='Lundi',heure_deb=hor,heure_fin=hor,Cours=nc ,Enseignants=pro,Semaine=sem,Filiere=fil,Salle=sal,annee=annee)
        
        #premier cours Mardi
        hor = request.POST['ptm']
        nc = request.POST['pc2']
        pro =request.POST['pf2']
        sal =request.POST['ps2']
        if hor and nc and pro and sal:
            mettre = Programme.objects.create(jour='Mardi',heure_deb=hor,heure_fin=hor,Cours=nc ,Enseignants=pro,Semaine=sem,Filiere=fil,Salle=sal,annee=annee)
         #deuxieme cours Mardi
        hor = request.POST['pd2']
        nc = request.POST['pdc2']
        pro =request.POST['pfs2']
        sal =request.POST['pss2']
        if hor and nc and pro and sal:
            mettre = Programme.objects.create(jour='Mardi',heure_deb=hor,heure_fin=hor,Cours=nc ,Enseignants=pro,Semaine=sem,Filiere=fil,Salle=sal,annee=annee)
        #premier cours Mercredi
        hor = request.POST['ptme']
        nc = request.POST['pc3']
        pro =request.POST['pf3']
        sal =request.POST['ps3']
        if hor and nc and pro and sal:
            mettre = Programme.objects.create(jour='Mercredi',heure_deb=hor,heure_fin=hor,Cours=nc ,Enseignants=pro,Semaine=sem,Filiere=fil,Salle=sal,annee=annee)
        #deuxieme cours Mercredi
        hor = request.POST['pd3']
        nc = request.POST['pdc3']
        pro =request.POST['pfs3']
        sal =request.POST['pss3']
        if hor and nc and pro and sal:
            mettre = Programme.objects.create(jour='Mercredi',heure_deb=hor,heure_fin=hor,Cours=nc ,Enseignants=pro,Semaine=sem,Filiere=fil,Salle=sal,annee=annee)
        #premier cours Jeudi
        hor = request.POST['ptj']
        nc = request.POST['pc4']
        pro =request.POST['pf4']
        sal =request.POST['ps4']
        if hor and nc and pro and sal:
            mettre = Programme.objects.create(jour='Jeudi',heure_deb=hor,heure_fin=hor,Cours=nc ,Enseignants=pro,Semaine=sem,Filiere=fil,Salle=sal,annee=annee)
        #deuxieme cours Jeudi
        hor = request.POST['pd4']
        nc = request.POST['pdc4']
        pro =request.POST['pfs4']
        sal =request.POST['pss4']
        if hor and nc and pro and sal:
            mettre = Programme.objects.create(jour='Jeudi',heure_deb=hor,heure_fin=hor,Cours=nc ,Enseignants=pro,Semaine=sem,Filiere=fil,Salle=sal,annee=annee)
        
        #premier cours Vendredi
        hor = request.POST['ptv']
        nc = request.POST['pc5']
        pro =request.POST['pf5']
        sal =request.POST['ps5']
        if hor and nc and pro and sal:
            mettre = Programme.objects.create(jour='Vendredi',heure_deb=hor,heure_fin=hor,Cours=nc ,Enseignants=pro,Semaine=sem,Filiere=fil,Salle=sal,annee=annee)
        #deuxieme cours Vendredi
        hor = request.POST['pd5']
        nc = request.POST['pdc5']
        pro =request.POST['pfs5']
        sal =request.POST['pss5']
        if hor and nc and pro and sal:
            mettre = Programme.objects.create(jour='Vendredi',heure_deb=hor,heure_fin=hor,Cours=nc ,Enseignants=pro,Semaine=sem,Filiere=fil,Salle=sal,annee=annee)
        # #premier cours Samedi
        hor = request.POST['pts']
        nc = request.POST['pc6']
        pro =request.POST['pf6']
        sal =request.POST['ps6']
        if hor and nc and pro and sal:
            mettre = Programme.objects.create(jour='Samedi',heure_deb=hor,heure_fin=hor,Cours=nc ,Enseignants=pro,Semaine=sem,Filiere=fil,Salle=sal,annee=annee)
        #deuxieme cours Samedi
        hor = request.POST['pd6']
        nc = request.POST['pdc6']
        pro =request.POST['pfs6']
        sal =request.POST['pss6']
        if hor and nc and pro and sal:
            mettre = Programme.objects.create(jour='Samedi',heure_deb=hor,heure_fin=hor,Cours=nc ,Enseignants=pro,Semaine=sem,Filiere=fil,Salle=sal,annee=annee)
        
        
    return render(request, 'home/admi.html')
        
        



