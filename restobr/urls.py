"""restobr URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from data.views import interPag,logIn,Productos,Oferta


urlpatterns = [
    path('admin/', admin.site.urls),
    #pantalla principal
    path('', interPag.home),
    #Administrador y sus opciones
    path('SesionAdmin',interPag.seAdmin),
    path('addProducto',Productos.agregarProducto ,name='post-agregar'),
    path('verOfertas',interPag.verOferta),
    path('optiadm',logIn.logIn),
    path('addOferta',Oferta.agregarOferta),
    #Garzon y sus opciones
    path('optgarzon',interPag.garzon),
    path('Comanda',interPag.newComanda),
    path('Indice',interPag.home)   
]

