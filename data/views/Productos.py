from django.shortcuts import render
from django.contrib import messages

from data.models import Admin,Producto,TipoProd



def agregarProducto(request):
    if request.method == 'POST':
            prod_id = request.POST['identificador']
            admin_rut = Admin.objects.get(admin_rut=request.POST['Run'])
            tp = TipoProd.objects.get(tp_id=request.POST['tipoProd'])
            prod_nombre = request.POST['nombre']
            prod_precio = request.POST['precio']
            prod_fecha_ingreso = request.POST['fechaingreso']
            try:
                Prod = Producto.objects.get(prod_id = prod_id)
            except Producto.DoesNotExist:
                Producto(prod_id = prod_id,admin_rut=admin_rut,tp =tp,prod_nombre =prod_nombre,prod_precio =prod_precio,prod_disponible = 1,prod_fecha_ingreso = prod_fecha_ingreso).save()
                messages.success(request,"El producto se ingreso de forma correcta ")
                return render(request,"addProducto.html", {},status=200)
            messages.error(request,'El producto ingresado ya existe')
            return render(request,"addProducto.html", {},status=200)
    else:
        return render(request,"addProducto.html", {},status=200)