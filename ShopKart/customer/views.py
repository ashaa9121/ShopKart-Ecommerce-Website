from django.http import response
from django.http.request import HttpRequest
from django.shortcuts import render

from .forms import RegistrationForm
from django.http.response import HttpResponseRedirect
from django.urls.base import reverse, reverse_lazy
from django.contrib.auth.models import User
# Create your views here.
#def index(request):
    #return response.HttpResponse("hiiii")


def registercustomer(request):
    if request.method == 'POST':
        registerform = RegistrationForm(request.POST)
        if registerform.is_valid():
            username = registerform.cleaned_data['username']	
            email = registerform.cleaned_data['emailid']	
            firstname = registerform.cleaned_data['firstname']	
            lastname = registerform.cleaned_data['lastname']	
            password = registerform.cleaned_data['password']	
            if  User.objects.filter(username=username).exists():
                registerform = RegistrationForm(request.POST)
                context = {'registerform':registerform,'error':'Username already exists add a new one'}
                return render(request,'customer/registercustomer.html',context)
            else:	
                user = User.objects.create_user(username = username, 
                                                email = email, 
                                                password = password,
                                                first_name = firstname,
                                                last_name = lastname)
                user.save()
                return HttpResponseRedirect(reverse('logincustomer'))
        else:
            registerform = RegistrationForm(request.POST)
            context = {'registerform':registerform}
            return render(request,'customer/registercustomer.html',context)
    else:
        registerform = RegistrationForm()
    return render(request,'customer/registercustomer.html',{'registerform':registerform})

from .forms import LoginForm
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required

def logincustomer(request):
    if request.user.is_authenticated:
        return HttpResponseRedirect(reverse('admindashboard') )
    else:	
        if request.method == 'POST':
            login_form = LoginForm(request.POST)
            if login_form.is_valid():
                username = login_form.cleaned_data['username']
                password = login_form.cleaned_data['password']

                user = authenticate(username=username, password=password)
                                
                if user is not None:
                    if user.is_active:
                        login(request,user)	
                        return HttpResponseRedirect(reverse('admindashboard') )
                    else:
                        login_form = LoginForm(request.POST)
                        return render(request, "customer/logincustomer.html",{"form":login_form})
                else:
                    login_form = LoginForm(request.POST)
                    return render(request, "customer/logincustomer.html",{"form":login_form})
            else:
                login_form = LoginForm(request.POST)
                return render(request, "customer/logincustomer.html",{"form":login_form})
        else:
            login_form = LoginForm()
        return render(request,'customer/logincustomer.html',{"form":login_form})

@login_required(login_url = reverse_lazy('logincustomer'))
def logoutcustomer(request):
    logout(request)
    return HttpResponseRedirect(reverse('admindashboard'))      