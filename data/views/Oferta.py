from django.shortcuts import render
from django.contrib import messages
from data.models import Admin,Oferta

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