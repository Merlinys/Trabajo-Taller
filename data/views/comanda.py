from django.shortcuts import render
from django.contrib import messages
from data.models import *
import datetime

def nuevaComanda(request):
    #compureba si existe un cliente con ese rut , si no existe crea uno con el nombre
    try:
        cliente = Cliente.objects.get(cli_rut =request.POST['Rut_Cli'])
    except Cliente.DoesNotExist:
        Cliente(cli_rut=request.POST['Rut_Cli'],cli_nombre =request.POST['nombre']).save()
        
    #comprueba que los datos sean correctos
    try:
        mesa = Mesa.objects.get(mesa_id=request.POST['mesa'])
    except Mesa.DoesNotExist:
        messages.error(request,"Mesa no existe")
        return render(request,"Comanda.html", {},status=200)
    
    try:
        garzon = Garzon.objects.get(gar_rut =request.POST['Rut_Gar'])
    except Garzon.DoesNotExist:
        messages.error(request,"Rut de garzon invalido")
        return render(request,"Comanda.html", {},status=200)
    
    #Creacion de la comanda
    try:
        comanda = Comanda.objects.get(com_id = request.POST['id_com'])
    except Comanda.DoesNotExist:
        Comanda(com_id=request.POST['id_com'],gar_rut= Garzon.objects.get(gar_rut =request.POST['Rut_Gar']),cli_rut = Cliente.objects.get(cli_rut =request.POST['Rut_Cli']),mesa = Mesa.objects.get(mesa_id=request.POST['mesa']),com_fecha_hora = datetime.date.today(),com_nro_personas=request.POST['cantidad'])
        messages.success(request,"Comanda ingresada correctamente")
        return render(request,"Comanda.html", {},status=200)   
    messages.error(request,"Comanda invalida")
    return render(request,"Comanda.html", {},status=200) 
    