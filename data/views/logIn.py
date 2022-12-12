from django.shortcuts import render
from django.core.exceptions import ObjectDoesNotExist
from data.models import Admin

# Create your views here.

"""Funcion que comprueba si existe un usuario
Existe : Va hacia la pagina de opciones de administrador
No existe: Reinicia la pagina
"""

def logIn(request):
    if request.method == "POST":
        try:
            usuario = Admin.objects.get(admin_mombre=request.POST["txt"],admin_rut=request.POST["Id"],admin_pass=request.POST["contra"])      
        except ObjectDoesNotExist:
            return render(request, "SesionAdmin.html", {},status=404)    
        return render(request, "optiadm.html",{} )  

