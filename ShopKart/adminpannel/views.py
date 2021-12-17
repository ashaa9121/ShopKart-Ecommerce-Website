from django.http import HttpResponse
from django.http.response import HttpResponseRedirect, HttpResponseRedirectBase
from django.shortcuts import render
from django.urls.base import reverse
from .forms import LoginForm


#def loginadmin(request):
    #return HttpResponse("Hello, World!")
    #login_form = LoginForm(request.POST)
    #login_form = LoginForm()
    #return render(request, "adminpannel/login.html",{"form":login_form})
    #return render(request, "adminpannel/login.html")



from django.shortcuts import render
from .forms import LoginForm
from django.contrib.auth import authenticate, login, logout
from django.http import HttpResponse

#------------------------------Admin-login code-------------------------------
def loginadmin(request):
    if request.user.is_authenticated:
        return HttpResponse('You Are already logged in')
    else:	
        if request.method == 'POST':
            login_form = LoginForm(request.POST)
            if login_form.is_valid():
                username = login_form.cleaned_data['username']
                password = login_form.cleaned_data['password']

                user = authenticate(username=username, password=password)
                                
                if user is not None:
                    if user.is_active and user.is_superuser:
                        login(request,user)	
                        #return HttpResponse('Login Successful')
                        return HttpResponseRedirect(reverse('admindashboard') )
                    else:
                        return HttpResponse('Your account is not active')
                else:
                    return HttpResponse('The Account does not exists')
            else:
                login_form = LoginForm()
                return render(request, "adminpannel/login.html",{"form":login_form})
        else:
            login_form = LoginForm()
        return render(request,'adminpannel/login.html',{"form":login_form})

def checksuperuser(user):
    return user.is_superuser

from django.urls import reverse_lazy
from django.contrib.auth.decorators import user_passes_test

@user_passes_test(checksuperuser,login_url = reverse_lazy('login'))
def admindashboard(request):
    return render(request,'adminpannel/admindashboard.html',{})    


@user_passes_test(checksuperuser,login_url = reverse_lazy('login'))
def logoutadmin(request):
    logout(request)
    #return HttpResponseRedirectBase(reverse('login')) 
    return HttpResponseRedirect(reverse('login') )    
     

#----------------------Manage Products---------------------  

from .models import Products

@user_passes_test(checksuperuser,login_url = reverse_lazy('login'))
def manageproducts(request):
    products = Products.objects.all()
    return render(request,'adminpannel/manageproducts.html',{'products':products})


#--------------------Add Product---------------------

from .forms import ProductForm

@user_passes_test(checksuperuser,login_url = reverse_lazy('login'))
def addproduct(request):
    if request.method == 'POST':
        product_form = ProductForm(request.POST, request.FILES)
        if product_form.is_valid():
            product_name = product_form.cleaned_data['product_name']
            product_description = product_form.cleaned_data['product_description']
            price = product_form.cleaned_data['price']
            product_image = request.FILES['product_image']

            product_instance = Products(product_name = product_name, 
                                        product_description = product_description,
                                        price = price,
                                        product_picture = product_image)
            product_instance.save()
            return HttpResponseRedirect(reverse('manageproducts'))
        else:
            product_form = ProductForm(request.POST, request.FILES)
            return render(request,'adminpannel/addproduct.html',{'productform':product_form}) 
    else:
        product_form = ProductForm()
        return render(request,'adminpannel/addproduct.html',{'productform':product_form})   

#-----------------------------------------------------------         