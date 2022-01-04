#!/bin/bash

source empezar.lib
source entrar.lib
source carpeta.lib
source tratar.lib
source logs.lib
source acabar.lib

CNT=0

OPT1=BLACKUP
OPT2=INCIDENCIAS
OPT3=SALIR
ANT_PS3=$PS3

f_limpiar
f_presentacion
f_entrar


HOY=`date +%B/%A/%d`
mkdir LOGS




PS3="ELIGE $USER que quieres hacer $OPT1, $OPT2, $OPT3 : "

select backup in $OPT1 $OPT2 $OPT3;
do
	case $backup in
		$OPT1)
		f_limpiar
		f_empezar

			read -p "dime que fichero extension copiar" EXT
			read -p "nombre directorio de copia" direc
			Carpeta=$direc$(date +%m-%d-%Y)
			mkdir $Carpeta
			f_carpeta.copy
			f_carpeta.logs


			for FILE in $(locate "$EXT" )
			do

				f_tratar $FILE

			done
				f_logs
				f_acabar
		;;

		$OPT2)
			f_limpiar
			f_incidencia
			read -p "Dime incidencia " INC
			echo " $HOY >>   $INC -" >> log_incidencia.txt 
			f_logs
			f_salir
		;;


		$OPT3)  f_limpiar
			echo " $USER elegido SALIR"
			f_salir
		;;


	esac
done

PS3=$ANT_PS3
