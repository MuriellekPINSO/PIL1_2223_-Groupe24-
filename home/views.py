from django.shortcuts import render

# Create your views here.


def home(request):

    context = {}

    return render(request, 'home/default.html')
    
    
def licence(request, pk):

    context = {
        'classe': f"Licence {pk}"
    }

    return render(request, 'home/licence.html', context)
    
    
def master(request, pk):

    context = {
        'classe': f"Master {pk}"
    }

    return render(request, 'home/master.html', context)