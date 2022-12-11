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
            return render(request,"payment.html")
        
       
        try:
            comanda = Comanda.objects.get(com_id=request.POST['idComanda'])
        except Comanda.DoesNotExist:
            messages.error(request,"ID Comanda incorrecto")
            return render(request,"payment.html") 
        
        #Comprueba si ya existe una venta con ese id
        if Venta.objects.filter(ven_id = request.POST['id venta']):
            messages.error(request,"ID venta incorrecto")
            return render(request,"payment.html")
        
        #Variables
        metodoPago = TipoPago.objects.get(tpag_id = int(request.POST.get('metodo')))
        bancos = Banco.objects.get(banco_id= int(request.POST.get('Banco')))
        
        Venta(ven_id = request.POST['id venta'],ven_fecha=datetime.date.today()).save()
        coma = Comanda.objects.get(com_id=request.POST['idComanda'])
        coma.ven = Venta.objects.get(ven_id = request.POST['id venta'])
        coma.save()
        if metodoPago.tpag_id ==2:
            Pago(pago_id = request.POST['id venta'],banco = bancos,ven = Venta.objects.get(ven_id = request.POST['id venta']),tpag =metodoPago,pago_fecha_hora = datetime.datetime.today(),pago_nro_boucher = request.POST['boucher'],pago_monto = request.POST['Precio']  ).save()
        else:
            Pago(pago_id = request.POST['id venta'],ven = Venta.objects.get(ven_id = request.POST['id venta']),tpag =metodoPago,pago_fecha_hora = datetime.datetime.today(),pago_nro_boucher = request.POST['boucher'],pago_monto = request.POST['Precio']  ).save()

        messages.success("Pago realizado correctamente")
        return render(request,"payment.html")
        
        
        
            
        
        
        