from django.shortcuts import render
from django.contrib import messages
from data.models import *

import datetime

def cancelarComanda(request):
    if request.method =="POST":
        #Comprobar que existen objetos con los atributos requeridos
        try:
            clienteexist= Cliente.objects.get(cli_rut=request.POST['Rut_Cliente'])
        except Cliente.DoesNotExist:
            messages.error(request,"Rut Cliente incorrecto")
            return render (request,"payment.html")
        try:
            garzon = Garzon.objects.get(gar_rut=request.POST['Garzon_Rut'])
        except Garzon.DoesNotExist:
            messages.error(request,"Rut Garzon incorrecto")
            return render (request,"payment.html")
        try:
            comanda = Comanda.objects.get(com_id=request.POST['idComanda'])
        except Comanda.DoesNotExist:
            messages.error(request,"ID Comanda incorrecto")
            return render (request,"payment.html")
        
        