from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from home.models import Filiere, Salle


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
    return render(request, 'home/admi.html')

@login_required()
def creer_filiere(request):

    errors = []  
    if request.method == 'POST':
        nom = request.POST.get('nom')

        if nom :
            filiere = Filiere.objects.create(nom=nom)

            return redirect('home')  
        else:
            errors.append("Le nom de la filière est obligatoire") 

    context = {
        'errors': errors
    }     

    return redirect('admin_index')



@login_required()
def ajouter_salle(request):

    errors = []  
    if request.method == 'POST':
        nom_salle = request.POST.get('nom')
        capacite = request.POST.get('capacité')

        if nom_salle and capacite:

            salle = Salle.objects.create(nom_salle=nom_salle, capacite_Salle=capacite)

            return redirect('home')  
        else:
            errors.append("Remplissez tous les champs") 

    context = {
        'errors': errors
    }     

    return redirect('admin_index')

