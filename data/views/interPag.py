from django.shortcuts import render
from data.models import *
import datetime

# Create your views here.
#inicia la pestaña con la pagina principal
def home(request):
    return render(request, "indice.html", {},status=200)

    

# Pantalla de inicio de sesion de admin
def seAdmin(request):
    return render(request, "SesionAdmin.html", {},status=200)

#pantalla añadir ofertas
def addProducto(request):
    return render(request, "addProducto.html", {},status=200)

#Pantalla ver Oferta
def verOferta(request):
    return render(request,'verOfertas.html',{},status=200)

#Pantalla garzon
def garzon(request):
    return render(request,'optgarzon.html',{},status=200)

#pantalla nueva comanda
def newComanda(request):
    return render(request,'Comanda.html',{},status=200)

#Pantalla nueva oferta
def newOferta(request):
    return render(request,'addOferta.html',{},status=200)

def menu(request):
    return render(request,'Carta.html',{},status=200)

def pago(request):
    return render(request,'payment.html',{},status=200)