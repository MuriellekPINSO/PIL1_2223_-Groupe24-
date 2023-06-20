from django.shortcuts import render
from django.contrib.auth.decorators import login_required

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