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
        return HttpResponse('You are already logged in')
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
from django.contrib.auth.decorators import login_required, user_passes_test

@user_passes_test(checksuperuser,login_url = reverse_lazy('login'))
def admindashboard(request):
    return render(request,'adminpannel/admindashboard.html',{})    


@login_required(login_url = reverse_lazy('login'))
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


#-------------------Enable/Disable product(Admin)--------------------

from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
@user_passes_test(checksuperuser,login_url = reverse_lazy('login'))
def changestatus(request):
    #if request.is_ajax():
        product_id = request.POST.get('product')
        action = request.POST.get('action')
        product_instance = Products.objects.get(id=product_id)
        if action == "disable":
            product_instance.is_active = 0
        else:
            product_instance.is_active = 1
        product_instance.save()
        return JsonResponse({'result':'success'})
#-----------------------------------------------------------------

#-------------Edit Product----------------------------------------

from .forms import EditProductForm
from .models import models

@user_passes_test(checksuperuser,login_url = reverse_lazy('login'))
def editproduct(request,product_id):
    if request.method == 'POST':
        product_form = EditProductForm(request.POST, request.FILES)
        if product_form.is_valid():
            product_name = product_form.cleaned_data['product_name']
            product_description = product_form.cleaned_data['product_description']
            price = product_form.cleaned_data['price']
            product_instance = Products.objects.get(id=product_id)
            product_instance.product_name = product_name
            product_instance.product_description = product_description
            product_instance.price = price
            if request.FILES:
                product_image = request.FILES['product_image']
                product_instance.product_picture = product_image
            product_instance.save()
            return HttpResponseRedirect(reverse('manageproducts'))
        else:
            product_form = EditProductForm(request.POST, request.FILES)
            return render(request,'adminpannel/editproduct.html',{'productform':product_form}) 
    else:
        product_instance = Products.objects.get(id=product_id)
        product_form = EditProductForm(initial={'product_name': product_instance.product_name,
                                            'product_description':product_instance.product_description,
                                            'price':product_instance.price,
                                            'product_image':product_instance.product_picture
                                            })
        return render(request,'adminpannel/editproduct.html',{'productform':product_form,'current_image':product_instance.product_picture})
        
#-----------------Delete Product------------------------------

@user_passes_test(checksuperuser,login_url = reverse_lazy('login'))
def deleteproduct(request,product_id):
    product_instance = Products.objects.get(id=product_id)
    product_instance.delete()
    return HttpResponseRedirect(reverse('manageproducts'))


#----------------------Manage users------------------------

from django.contrib.auth.models import User

@user_passes_test(checksuperuser,login_url = reverse_lazy('login'))
def manageusers(request):
    users = User.objects.filter(is_superuser = 0,is_staff = 0)
    return render(request,'adminpannel/manageusers.html',{'users':users})


#---------------Change user status-----------------------------  


@csrf_exempt
@user_passes_test(checksuperuser,login_url = reverse_lazy('login'))
def changestatususer(request):
    if request.is_ajax:
        action = request.POST['action']
        user_id = int(request.POST['user_id'])
        user_instance = User.objects.get(id=user_id)
        if action == "disable":
            user_instance.is_active = 0
        else:
            user_instance.is_active = 1
        user_instance.save()
        return JsonResponse({'result':'success'})


#---------------Delete user-------------------

@user_passes_test(checksuperuser,login_url = reverse_lazy('login'))
def deleteuser(request,user_id):
    user_instance = User.objects.get(id=user_id)
    user_instance.delete()
    return HttpResponseRedirect(reverse('manageusers'))  

#--------------------User details----------------

from customer.models import customerPayedProducts
@user_passes_test(checksuperuser,login_url = reverse_lazy('login'))
def viewuser(request,user_id):
    user_instance = User.objects.get(id=user_id)
    orders = customerPayedProducts.objects.filter(customer = user_id, checkout_details__payment_complete =1)
    return render(request,'adminpannel/userview.html',{'user':user_instance,'orders':orders})
      
#------------Admin view reports and todays sales reports---------------------

from customer.models import CustomerCheckout
import datetime
import csv

@user_passes_test(checksuperuser,login_url = reverse_lazy('login'))
def adminviewreports(request):
    return render(request,'adminpannel/adminreports.html',{})


@user_passes_test(checksuperuser,login_url = reverse_lazy('login'))
def todayssalesreport(request):
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename="salesreport"'+str(datetime.date.today())+'".csv"'
    writer = csv.writer(response)
    today_min = datetime.datetime.combine(datetime.date.today(), datetime.time.min)
    today_max = datetime.datetime.combine(datetime.date.today(), datetime.time.max)
    sales = CustomerCheckout.objects.filter(payedon__range=(today_min, today_max))
    writer.writerow(['Order_id', 'Payment_id', 'Amount', 'Reciept', 'Phonenum', 'Address'])
    for sale in sales:
        writer.writerow([sale.order_id, sale.payment_id, sale.total_amount, sale.reciept_num, sale.delivery_phone, sale.delivery_address])
    return response 
