from django.shortcuts import render
from django.contrib import messages
from data.models import *
import datetime

def nuevaComanda(request):
    cli_nomber = request.POST['nombre']
    cli_rut =request.POST['Rut_Cli']