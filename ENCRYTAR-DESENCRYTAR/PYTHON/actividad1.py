#!/usr/bin/python3


from cryptography.fernet import Fernet


def genera_clave():
	clave = Fernet.generate_key()
	with open("clave.key","wb") as archivo_clave:
		archivo_clave.write(clave)





def carga_clave():
	return open("clave.key","rb").read()


def encript(nom_archivo,clave):
	f = Fernet(clave)
	with open(nom_archivo,"rb") as file:
		archivo_info = file.read()
	encrypted_data = f.encrypt(archivo_info)
	with open(nom_archivo,"wb") as file:
		file.write(encrypted_data)

def desencript(nom_archivo,clave):
	f = Fernet(clave)
	with open(nom_archivo,"rb") as file:
		encrypted_data = file.read()
	decrypted_data = f.decrypt(encrypted_data)
	with open(nom_archivo,"wb") as file:
		file.write(decrypted_data)








print "Dime si quieres encriptar (1)  o  desencriptara (2) "
print "=================================================================="

respuesta = input("respuesta:")

if (respuesta == 1 ):

	genera_clave()

	clave = carga_clave()

	nom_archivo = "texto.txt"

	encript(nom_archivo,clave)


elif (respuesta == 2):

	clave = carga_clave()
       	nom_archivo = "texto.txt"
       	desencript(nom_archivo,clave)



else:

	print "ERROR de respuesta"

