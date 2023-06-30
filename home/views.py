from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from home.models import Filiere, Salle, Semaine, Cours, Enseignant, Niveau, Programme
from datetime import datetime


# Create your views here.

@login_required()
def home(request):

    niveaux = Niveau.objects.all()

    context = {
        "niveaux" : niveaux
    }


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
def niveau(request, pk):


    derniere_semaine = Semaine.objects.filter(publich=1).latest('date_debut')

    programmes = Programme.objects.filter(niveau=pk, semaine=derniere_semaine.id).order_by('heure_deb')

    niveaux = Niveau.objects.all()
    niveau = Niveau.objects.get(pk=pk)

    context = {
        "programmes" : programmes,
        'dernieresemaine' : derniere_semaine,
        'niveaux' : niveaux,
        'niveau' : niveau
        }
    


    return render(request, 'home/emploi_par_niveau.html', context)

@login_required()
def admin_index(request):

    semaines = Semaine.objects.all().order_by('-nemuro_semaine')
    niveaux = Niveau.objects.all()


    return render(request, 'home/admi.html', {'semaines' : semaines, 'niveaux' : niveaux})

@login_required()
def creer_filiere(request):

    errors = []  
    if request.method == 'POST':
        nom_filiere = request.POST.get('name')

        if nom_filiere :
            filiere = Filiere.objects.create(name = nom_filiere)

            return redirect('admin_index')  
        else:
            errors.append("Le nom de la filière est obligatoire") 

    context = {
        'errors': errors
    }     

    return render(request, 'home/creer_filiere.html', context)



@login_required()
def ajouterSalle(request):

    errors = []  
    if request.method == 'POST':
        nom_salle = request.POST.get('name')
        capacite = request.POST.get('capacity')

        if nom_salle and capacite:

            salle = Salle.objects.create(nom_Salle=nom_salle, capacite_Salle=capacite)

            return redirect('admin_index')  
        else:
            errors.append("Remplissez tous les champs") 

    context = {
        'errors': errors
    }     

    return render(request, 'home/ajouter_salle.html', context)


@login_required()
def ajouterSemaine(request):

    errors = []  
    if request.method == 'POST':
        numero = request.POST.get('week-number')
        annee = request.POST.get('academic-year')
        date_debut = datetime.strptime(request.POST['date_debut'], '%Y-%m-%d').date()
        date_fin = datetime.strptime(request.POST['date_fin'], '%Y-%m-%d').date()
        publich = request.POST.get('publish')  

        if numero and annee and date_debut and date_fin:
            if date_fin > date_debut:
                semaine = Semaine.objects.create(nemuro_semaine=numero, annee_scolaire=annee, date_debut=date_debut, date_fin=date_fin, publich = publich)
                return redirect('admin_index')  
            else:
                errors.append("La date fin doit etre supérieure à la date debut") 
        else:
            errors.append("Remplissez tous les champs") 

    context = {
        'errors': errors
    }     

    return render(request, 'home/ajouter_semaine.html', context)


@login_required()
def ajouterMatiere(request):

    errors = []  
    if request.method == 'POST':
        nom_matiere = request.POST.get('name')
        filiere_id = request.POST.get('filiere')
        niveau_id = request.POST.get('niveau')

        if nom_matiere  and filiere_id and niveau_id:

            try:
                filiere = Filiere.objects.get(pk=filiere_id)
                niveau = Niveau.objects.get(pk=niveau_id)

                cours = Cours.objects.create(nom_cours=nom_matiere, niveau=niveau, filiere = filiere)
                cours.save()
                return redirect('admin_index')  
            except (Filiere.DoesNotExist, Niveau.DoesNotExist):
                errors.append("La filière ou le niveau n'existe pas")
        else:
            errors.append("Remplissez tous les champs") 



    niveaux = Niveau.objects.all()
    filieres= Filiere.objects.all()

    return render(request, 'home/ajouter_matiere.html', {'filieres': filieres,'niveaux': niveaux,  'errors' : errors })


@login_required()
def ajouterEnseignant(request):

    errors = []  
    if request.method == 'POST':
        nom_en = request.POST.get('nom')
        prenom_en = request.POST.get('prenom')
        contact_en = request.POST.get('contact')
        filiere_id = request.POST.get('filiere')

        if nom_en and prenom_en and contact_en and contact_en:
            try:
                filiere = Filiere.objects.get(pk=filiere_id)
                enseignant = Enseignant.objects.create(nom=nom_en, prenom=prenom_en, contact = contact_en, filiere=filiere)
                enseignant.save()
                return redirect('admin_index')  
            except Filiere.DoesNotExist:
                errors.append("La filière n'existe pas") 
        else:
            errors.append("Remplissez tous les champs") 

    filieres = Filiere.objects.all()

    return render(request, 'home/ajouter_enseignant.html', {'filieres': filieres, 'errors' : errors }, ) 

@login_required()
def ajouterNiveau(request):

    errors = []  
    if request.method == 'POST':
        nom_niveau = request.POST.get('name')

        if nom_niveau :

            niveau = Niveau.objects.create(nom=nom_niveau)

            return redirect('admin_index')  
        else:
            errors.append("Remplissez tous les champs") 

    context = {
        'errors': errors
    }     

    return render(request, 'home/ajouter_niveau.html', context)




@login_required()

def ajouterProgramme(request, pk):
    errors = []
    
    if request.method == 'POST':
        heure_debut = request.POST.get('heure_debut')
        heure_fin = request.POST.get('heure_fin')
        jour = request.POST.get('jour')
        salle_id = request.POST.get('salle')
        semaine_id = request.POST.get('semaine')
        matiere_id = request.POST.get('matiere')
        filieres_ids = request.POST.getlist('filieres[]')
        niveau_id = request.POST.get('niveau')
        enseignant_id = request.POST.get('enseignant')
        programme_pk = request.POST.get('programme_pk')

        if heure_debut and heure_fin and jour and salle_id and enseignant_id and semaine_id and matiere_id and filieres_ids and niveau_id and jour:
            

            try:
                salle = Salle.objects.get(pk=salle_id)
                semaine = Semaine.objects.get(pk=semaine_id)
                cours = Cours.objects.get(pk=matiere_id)
                niveau = Niveau.objects.get(pk=niveau_id)
                enseignant = Enseignant.objects.get(pk=enseignant_id)

                

                if programme_pk is None:
                    programme = Programme.objects.create(
                            niveau=niveau,
                            cours=cours,
                            salle=salle,
                            semaine=semaine,
                            heure_deb=heure_debut,
                            heure_fin=heure_fin,
                            jour=jour,
                            enseignant = enseignant
                            
                    )
                

                    programme.filieres.set(filieres_ids)

                        
                    
                else: 
                    programme = Programme.objects.get(pk = programme_pk)

                    programme.niveau = niveau
                    programme.cours = cours
                    programme.salle = salle
                    programme.semaine = semaine
                    programme.heure_deb = heure_debut
                    programme.heure_fin = heure_fin
                    programme.jour = jour
                    programme.enseignant = enseignant

                    programme.filieres.set(filieres_ids)

                    programme.save()


            except (Filiere.DoesNotExist, Salle.DoesNotExist, Semaine.DoesNotExist, Cours.DoesNotExist, Niveau.DoesNotExist):
                    # Gérer les erreurs si les objets n'existent pas
                    pass
            return redirect('admin.ajouter.programme', pk=pk) 
            
        else:
            errors.append('Remplissez tous les champs')

    filieres = Filiere.objects.all()
    matieres = Cours.objects.all()
    semaines = Semaine.objects.all()
    salles = Salle.objects.all()
    niveaux = Niveau.objects.all()
    enseignants = Enseignant.objects.all()
    derniere_semaine = Semaine.objects.latest('id')

    
    derniere_semaine = Semaine.objects.filter(publich=0).latest('date_debut')


    programmes = Programme.objects.filter(semaine=pk)
    


    return render(request, 'home/ajouter_programme.html', {
        'filieres': filieres,
        'matieres': matieres,
        'semaines': semaines,
        'salles': salles,
        'niveaux': niveaux,
        'enseignants' : enseignants,
        'semaineActuelle': derniere_semaine,
        'programmes' : programmes,
        'errors': errors,
        'semaine' : pk
    })




from django.shortcuts import get_object_or_404

@login_required
def deleteProgramme(request, programme_id):
    errors = []

    try:
        programme = get_object_or_404(Programme, pk=programme_id)
        programme.delete()
    except Programme.DoesNotExist:
        errors.append('Le programme spécifié n\'existe pas')
    except Exception as e:
        errors.append('Une erreur s\'est produite lors de la suppression ')

    return redirect(request.META.get('HTTP_REFERER'))


@login_required
def listeSemaines(request):
    semaines = Semaine.objects.all().order_by('-id')

    return render(request, 'home/liste_semaine.html', {
        'semaines': semaines,

    })

@login_required
def modifierSemaine(request, semaine_id):

    errors = []
    if request.method == 'POST':
        numero = request.POST.get('week-number')
        annee = request.POST.get('academic-year')
        date_debut = request.POST.get('date_debut')
        date_fin = request.POST.get('date_fin')
        publich = request.POST.get('publish') 

        if numero and annee and date_debut and date_fin and publich:

            try:
                semaine = Semaine.objects.get(pk = semaine_id)

                semaine.nemuro_semaine = numero
                semaine.annee_scolaire = annee
                semaine.date_debut = date_debut
                semaine.date_fin = date_fin
                semaine.publich = publich

                semaine.save()
        
    
            except Semaine.DoesNotExist:

                errors.append('Une erreure s\'est produite lors de la mise à jour')
            
            return redirect('admin.modifier.semaine', semaine_id) 

        else: 

            errors.append('Remplissez tous les champs pour modifier la semaine')   
           

    semaines = Semaine.objects.all().order_by('-id')

    return render(request, 'home/liste_semaine.html', {
        'semaines': semaines,
        'errors' : errors
        
    })

@login_required
def deleteSemaine(request, semaine_id):
    errors = []

    try:
        semaine = get_object_or_404(Semaine, pk=semaine_id)
        semaine.delete()
    except Programme.DoesNotExist:
        errors.append('Le programme spécifié n\'existe pas')
    except Exception :
        errors.append('Une erreur s\'est produite lors de la suppression ')

    return redirect(request.META.get('HTTP_REFERER'))
