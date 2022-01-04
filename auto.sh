#!/bin/bash

source empezar.lib
source entrar.lib
source carpeta.lib
source tratar.lib
source logs.lib
source acabar.lib

CNT=0
EXT=jpg


f_presentacion
f_entrar


HOY=`date +%B/%A/%d`
Carpeta=COPY$(date +%m-%d-%Y)

mkdir $Carpeta
mkdir LOGS

f_carpeta.copy
f_carpeta.logs
f_empezar

for FILE in $(locate "$EXT" )
do
	f_tratar $FILE
done
	f_logs
	echo "BACKUP realizado $(date)  ">> /home/tony/Documentos/script.txt
	f_acabar


