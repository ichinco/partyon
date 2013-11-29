from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.

def index(request):
    return render(request, 'partyon/index.html', {})

def plan(request):
    return render(request, 'partyon/plan.html', {})


