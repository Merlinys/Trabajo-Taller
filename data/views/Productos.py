from django.shortcuts import render
from django.contrib import messages
from data.models import Admin,Producto,TipoProd

import datetime

#funcion para agregar productos
def agregarProducto(request):
    if request.method == 'POST':
        # Variables del producto , el request.post es para sacar la informacion de los bloque de texto del addProducto.html.
            prod_id = request.POST['identificador']
            #Revisa dentro de la tablas si existe un un objeto con ese dato
            admin_rut = Admin.objects.get(admin_rut=request.POST['Run'])
            tp = TipoProd.objects.get(tp_id=request.POST['tipoProd'])
            prod_nombre = request.POST['nombre']
            prod_precio = request.POST['precio']
            date_object = datetime.date.today()           
            #Comprueba si existe un producto con ese mismo producto id , si no existe lo crea y reinicia la pagina poniendo un mensaje de exito.
            try:
                Prod = Producto.objects.get(prod_id = prod_id)
            except Producto.DoesNotExist:
                Producto(prod_id = prod_id,admin_rut=admin_rut,tp =tp,prod_nombre =prod_nombre,prod_precio =prod_precio,prod_disponible = 1,prod_fecha_ingreso = date_object).save()
                messages.success(request,"El producto se ingreso de forma correcta ")
                return render(request,"addProducto.html", {},status=200)            
            messages.error(request,'El producto ingresado ya existe')
            return render(request,"addProducto.html", {},status=200)
    else:
        return render(request,"addProducto.html", {},status=200)