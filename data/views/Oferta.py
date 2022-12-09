from django.shortcuts import render
from django.contrib import messages
from data.models import Admin,Oferta,Producto,ProdOferta
import datetime



def agregarOferta(request):
    if request.method== 'POST':
        
        #Variables oferta
        idOferta = request.POST['id']
        diaInicio = request.POST['fechaI']
        diaFinal = request.POST['fechaF']
        admin_rut = Admin.objects.get()
        precio = request.POST['precio']
        
        try:
            oferta = Oferta.objects.get(of_id = idOferta)
        except Oferta.DoesNotExist:
            Oferta(of_id = idOferta,admin_rut = admin_rut,of_finicio = diaInicio,of_ffin =diaFinal,of_precio =precio).save()
            messages.success(request,"La oferta se ingreso de forma correcta")
            return render(request,"addOferta.html",{},status=200)
        messages.error(request,'La oferta ingresada ya existe')
        return render(request,"addOferta.html", {},status=200)
    else :
        return render(request,"addOferta.html", {},status=200)
    
    
    
def conexionOferta(request):
    if request.method =='POST':
        
        try:
            produc = Producto.objects.get(prod_id = request.POST['id_prod'])
            ofer = Oferta.objects.get(of_id = request.POST['id_offer'])
            prof = ProdOferta.objects.get(prod = produc)
        except Producto.DoesNotExist:
            messages.error(request,'El producto ingresado no existe')
            return render(request,"addOferta.html", {},status=200)
        except Oferta.DoesNotExist:
            messages.error(request,'La oferta ingresada no existe')
            return render(request,"addOferta.html", {},status=200)
        except ProdOferta.DoesNotExist:
            ProdOferta(prod = produc,of =ofer).save()
            messages.success(request,'Oferta configurada correctamente')
            return render(request,"addOferta.html", {},status=200)  
        
        
        messages.error(request,'El producto ya tiene una oferta conectada')
        return render(request,"addOferta.html", {},status=200)  
    

    