from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from rest_framework.decorators import api_view,permission_classes
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from django.contrib.auth.models import User
from customer.forms import RegistrationForm
from rest_framework.status import (
    HTTP_400_BAD_REQUEST,
    HTTP_404_NOT_FOUND,
    HTTP_200_OK
)

#--------------------Registration api------------------------
@csrf_exempt
@api_view(["POST"])
@permission_classes((AllowAny,))
def registercustomer(request):
    #return Response({'key':'hi'},status = HTTP_200_OK)
    registerform = RegistrationForm(request.data)
    if registerform.is_valid():
            username = registerform.cleaned_data['username']	
            email = registerform.cleaned_data['emailid']	
            firstname = registerform.cleaned_data['firstname']	
            lastname = registerform.cleaned_data['lastname']	
            password = registerform.cleaned_data['password']	
            if  User.objects.filter(username=username).exists():
                registerform = RegistrationForm(request.POST)
                context = {'registerform':registerform.data,
                            'error':'Username already exists add a new one'}
                return Response(context,status = HTTP_400_BAD_REQUEST)
            else:	
                user = User.objects.create_user(username = username, 
                                                email = email, 
                                                password = password,
                                                first_name = firstname,
                                                last_name = lastname)
                user.save()
                context = {'registerform':registerform.data,'success':'Created user'}
                return Response(context,status = HTTP_200_OK)
    else:
        registerform = RegistrationForm(request.POST)
        context = {'registerform':registerform.data,'errors':registerform.errors}
        return Response(context,status = HTTP_400_BAD_REQUEST)


#--------------Login api-----------------------

from django.contrib.auth import authenticate
from rest_framework.authtoken.models import Token

@csrf_exempt
@api_view(["POST"])
@permission_classes((AllowAny,))
def logincustomer(request):
    username = request.data.get("username")#geting the data from the request
    password = request.data.get("password")
    if username is None or password is None: #checking wether any of the field is empty
        return Response({'error': 'Please provide both username and password'},
                        status=HTTP_400_BAD_REQUEST)
    user = authenticate(username=username, password=password)#authenticating a user
    if not user: #unauthenticated user
        return Response({'error': 'Invalid Credentials'},
                        status=HTTP_404_NOT_FOUND)
    token, _ = Token.objects.get_or_create(user=user)
    return Response({'token': token.key},status=HTTP_200_OK)


#-------------Logout api----------------------
@csrf_exempt
@api_view(["POST"])
def logoutcustomer(request):
    request.user.auth_token.delete()
    return Response({'message':'success'},status=HTTP_200_OK)
