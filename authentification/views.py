from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login as user_login, logout as user_logout
from django.contrib.auth.models import User


def login(request):
    if request.user.is_authenticated:
        return redirect('home')
    
    errors = []

    if request.method == 'POST':

        matricule = request.POST.get('matricule')
        password = request.POST.get('password')

        if password and matricule:
            user = authenticate(request, username=matricule, password=password)

            if user is not None:
                user_login(request, user)
                return redirect('home')
            errors.append("Mot de passe ou numero matricule invalide")
        else:
            errors.append("Veuillez remplir tout les champs")

    context = {
        'errors': errors
    }

    return render(request, 'authentification/login.html', context)


def register(request):
    if request.user.is_authenticated:
        return redirect('home')
    
    errors = []


    if request.method == 'POST':

        matricule = request.POST.get('matricule')
        firstname = request.POST.get('prenom')
        lastname = request.POST.get('nom')
        email = request.POST.get('email')
        password = request.POST.get('password')
        confirm_password = request.POST.get('confirm_password')

        if password and matricule and firstname and lastname:

            if password == confirm_password:
                user = User.objects.create_user(
                    username=matricule,
                    first_name=firstname,
                    last_name=lastname,
                    email=email,
                    password=password,
                )

                user = authenticate(request, username=matricule, password=password)

            errors.append("Vos deux mots de passe ne sont pas identiques")


            if user is not None:
                user_login(request, user)
                return redirect('home')
            errors.append("Mot de passe ou numero matricule invalide")
        errors.append("Veuillez remplir tout les champs")

    context = {
        'errors': errors
    }

    return render(request, 'authentification/register.html', context)

def new_password(request):

    context = {}

    return render(request, 'authentification/forgot-password.html', context)

def logout(request):
    user_logout(request)
    return redirect('login')