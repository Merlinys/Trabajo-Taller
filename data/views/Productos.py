from django.shortcuts import render

from django.core.exceptions import ObjectDoesNotExist

from data.models import Admin,Producto,TipoProd


def agregarProducto(request):
    if request.method == 'POST':
            prod_id = request.POST['identificador']
            admin_rut = Admin.objects.get(admin_rut=request.POST['Run'])
            tp = TipoProd.objects.get(tp_id=request.POST['tipoProd'])
            prod_nombre = request.POST['nombre']
            prod_precio = request.POST['precio']
            prod_disponible = request.POST['prodDis']
            prod_fecha_ingreso = request.POST['fechaingreso']
            Producto(prod_id = prod_id,admin_rut=admin_rut,tp =tp,prod_nombre =prod_nombre,prod_precio =prod_precio,prod_disponible = prod_disponible,prod_fecha_ingreso = prod_fecha_ingreso).save()
            return render(request,"addProducto.html", {},status=200)
    else:
        return render(request,"addProducto.html", {},status=200)