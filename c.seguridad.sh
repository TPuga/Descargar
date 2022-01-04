#!/bin/bash

source empezar.lib
source entrar.lib
source carpeta.lib
source tratar.lib
source logs.lib
source acabar.lib

CNT=0
EXT=jpg
OPT1=BLACKUP
OPT2=INCIDENCIAS
OPT3=SALIR
ANT_PS3=$PS3

f_limpiar
f_presentacion
f_entrar


HOY=`date +%B/%A/%d`
Carpeta=COPY$(date +%m-%d-%Y)

mkdir $Carpeta
mkdir LOGS

f_carpeta.copy
f_carpeta.logs

PS3="ELIGE $USER que quieres hacer $OPT1, $OPT2, $OPT3 : "

select backup in $OPT1 $OPT2 $OPT3;
do
	case $backup in
		$OPT1)
		f_limpiar
		f_empezar


			for FILE in $(locate "$EXT" )
			do

				f_tratar $FILE

			done
				f_logs
				f_acabar
		;;

		$OPT2)  echo "INCIDENCIA"
			read -p "Dime incidencia " INC
			echo " $HOY >>   $INC -" >> log_incidencia.txt 
			f_salir
		;;


		$OPT3)  echo " $USER elegido SALIR"
			f_salir
		;;


	esac
done

PS3=$ANT_PS3
