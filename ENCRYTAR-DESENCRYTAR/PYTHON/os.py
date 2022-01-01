#!/usr/bin/python3

import os


NOMBRE_ARCHIVO = 'selled_policies.csv'




print "LEEEMOS EL ARCHIVO"
print "===============\n"

archivo = open(NOMBRE_ARCHIVO, 'r')
contenido = archivo.read()
print contenido
archivo.close()


print "RECORREMOS EL FICHERO CSV"
print "=======================\n"

archivo = open(NOMBRE_ARCHIVO, 'r+')
for linea in archivo:
    print linea
print "'2021-01-17',2,'quecoches','MMT',1"
archivo.close()




