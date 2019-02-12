#!/bin/bash
#------------variables necesarias------------
ROJO='\033[01;31m'
BLANCO='\033[0m'
CYAN='\033[96m'
VERDE='\033[92m'
RUTA_TRABAJO="$HOME/Descargas"
VALIDA=45
#***********Notas************
#->para almacenar un retorno de funcion en vez de return usar echo y almacenarla de la siguiente manera #VAR=$(FUNCION)
:<<: 
->la maquina que lo ejecutara es el servidor en si 

pagina de ayuda: http://www.w3big.com/es/linux/default.html
--https://www.vozidea.com/como-descargar-archivos-de-google-drive-desde-la-consola (descarga archivos de drive)

->para crear variables locales se coloca el modificador "local" antes de declararla

->Para el paso de argumentos de una funcion se colocan alado y se llaman con la var $num_arg
	ej. *llamada a funcion: sudo_corr "hola mundo" 212
		*almacenamiento e impresion: 
			local x=$2
			echo $1 "este es" $2
		*salida: hola mundo este es 212

->dependencias necesarias
	-apache (no problem con version)
	-php(5.3 preserente o 5.*)
	-postgress
:

#------------Pendientes------------
:<<coment
->Revisaar para la instalacion de deéndencias (revisar si estan instaladas o no y preguntar si desea instalarlas)

coment
function valida_comando {
	if [ $? -eq 0 ]; then
		echo 1
	else
		echo -1
	fi
}

function descomprime {
	cd $RUTA_TRABAJO
	local salida
	unzip asistencia.zip
	VALIDA=$(valida_comando)
	if [ $VALIDA -eq 1 ]; then
		echo -e "\nDescompresion de archivos ${VERDE}[OK]${BLANCO}"
	else
		echo -e "\nDescompresion de archivos ${ROJO}[FALLO]${BLANCO}\n------------>Codigo de error: 2"
	fi
}

function descarga_archivos {
	echo "Descargando archivos de intalacion..."
	cd $RUTA_TRABAJO # cambiarlo por la direccion al sevidor apache
	if [ ! -f asistencia.zip ]; then
		wget https://pruebasapifbpr2.000webhostapp.com/asistencia.zip 
		#wget https://github.com/luisjaviermon/Asistencia/blob/master/asistencia.zip
		VALIDA=$(valida_comando)
		if [ $VALIDA -eq 1 ]; then
			echo -e "\nDescarga de archivos ${VERDE}[OK]${BLANCO}"
		else
			echo -e "\nDescarga de archivos ${ROJO}[FALLO]${BLANCO}\nERROR: Falla al descargar archivos\n------------>Codigo de error: 1"
		fi
	else
		echo -e "\nDescarga de archivos ${VERDE}[OK]${BLANCO}"
	fi
}

function sudo_corr {
	echo "prueba"
	VALIDA=$(valida_comando)
	if [ ! $VALIDA -eq 1 ]; then
		exit 0
	fi
	descarga_archivos
	if [ ! $VALIDA -eq 1 ]; then
		exit 1
	fi
	descomprime
	if [ ! $VALIDA -eq 1 ]; then
		exit 2
	fi
	
}

function sudo_err {
	echo -e "\n${ROJO}Para ejecutar este instalador porfavor ejecutelo de la siguiente manera: \n\n\t${CYAN}sudo ./instalador.sh${ROJO}${BLANCO}\n"
}

function main {
	if [ $UID != 0 ]; then #Verificar si se ejecuta como superusuario *NOTA:cambiar != por ==
		sudo_corr 
	else
		sudo_err
	fi
}

main 
	
