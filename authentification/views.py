from django.shortcuts import render

# Create your views here.


def login(request):

    context = {}

    return render(request, 'authentification/login.html', context)


def register(request):

    context = {}

    return render(request, 'authentification/register.html', context)

def new_password(request):

    context = {}

    return render(request, 'authentification/forgot-password.html', context)