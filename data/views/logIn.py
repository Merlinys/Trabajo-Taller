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
            usuario = Admin.objects.get(admin_mombre=request.POST["txt"],admin_rut=request.POST["rut"],admin_pass=request.POST["contra"])
        except ObjectDoesNotExist:
            return render(request, "SesionAdmin.html", {"error":True,"mensaje":"Revise los datos"},status=404)
    return render(request, "optiadm.html", {},status=200)  