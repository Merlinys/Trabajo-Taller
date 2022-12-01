from django.shortcuts import render
import datetime
# Create your views here.
#inicia la pestaña con la pagina principal
def home(request):
    return render(request, "indice.html", {},status=200)

# Pantalla de inicio de sesion de admin
def seAdmin(request):
    return render(request, "SesionAdmin.html", {},status=200)

#pantalla añadir ofertas
def addProducto(request):
    return render(request, "addProducto.html", {},status=200)

def verOferta(request):
    return render(request,'verOfertas.html',{},status=200)
