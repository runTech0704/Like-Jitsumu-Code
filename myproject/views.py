from django.http import HttpResponse
from django.shortcuts import render

def hello_world(request):
    return HttpResponse("Hello World!")

def hello_template(request):
    return render(request, 'hello.html')