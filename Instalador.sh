#!/bin/bash
#------------variables necesarias------------
ROJO='\033[01;31m'
BLANCO='\033[0m'
CYAN='\033[96m'

#***********Notas************
:<<: 

pagina de ayuda: http://www.w3big.com/es/linux/default.html
--https://www.vozidea.com/como-descargar-archivos-de-google-drive-desde-la-consola (descarga archivos de drive)
->para crear variables locales se coloca el modificador "local" antes de declararla

->Para el paso de argumentos de una funcion se colocan alado y se llaman con la var $num_arg
	ej. *llamada a funcion: sudo_corr "hola mundo" 212
		*almacenamiento e impresion: 
			local x=$2
			echo $1 "este es" $2
		*salida: hola mundo este es 212
:

#------------Pendientes------------
:<<coment

-> implementar para la descarga del comprimido: wget -P $HOME/Documentos https://github.com/luisjaviermon/Asistencia/blob/master/asistencia.zip

coment

function sudo_corr {
	local x=$2
}

function sudo_err {
	echo -e "\n${ROJO}Para ejecutar este instalador porfavor ejecutelo de la siguiente manera: \n\n\t${CYAN}sudo ./instalador.sh${ROJO}${BLANCO}\n"
	printf "hola"
}

function main {
	if [ $UID != 0 ]; then #Verificar si se ejecuta como superusuario *NOTA:cambiar != por ==
		sudo_corr "hola mundo" 212
	else
		sudo_err
	fi
}

main 
	
