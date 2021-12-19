from django.urls import path
from . import views
from django.views.generic import RedirectView
urlpatterns = [
    #path('', views.index, name='index'),
    path('login', views.loginadmin, name='login'),
    path('', RedirectView.as_view(url='login')),
    path('dashboard', views.admindashboard, name='admindashboard'),
    path('adminlogout', views.logoutadmin, name='adminlogout'),
    path('manage-products', views.manageproducts, name='manageproducts'),
    path('add-product', views.addproduct, name='addproduct'),
    path('change-product-status', views.changestatus, name='changestatus'),
    path('edit-product/<int:product_id>', views.editproduct, name='editproduct'),
    
]