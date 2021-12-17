from django.http import HttpResponse
from django.shortcuts import render
from .forms import LoginForm


def loginadmin(request):
    #return HttpResponse("Hello, World!")
    login_form = LoginForm(request.POST)
    login_form = LoginForm()
    return render(request, "adminpannel/login.html",{"form":login_form})
    #return render(request, "adminpannel/login.html")