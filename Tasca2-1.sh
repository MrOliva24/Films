#!/bin/bash

clear

display () {
	echo "-------------------------------------------------------------"
	echo "Títol: $titol"
	echo "Any: $any    Longitud: $long   Popularitat: $pop"
	echo "Edat minima:$edat   Premis: $premis   Tema: $tema"
	echo "Director: $director"
	echo "Actor: $actor"
	echo "Actriu: $actriu"
}

seleccio=1

while [ $seleccio == 1 ]
do
	echo "----------------------------------------------------------------"
	echo "----------------------------------------------------------------"
	echo " "
	echo "INTRODUEIX LA CADENA DE CARACTERS PER CERCAR A LA BASE DE DADES"
	echo " "
	echo "----------------------------------------------------------------"
	echo "----------------------------------------------------------------"
	read cadena
	clear
	
	
	awk -F";" -v pat="$cadena" '(tolower($3) ~ tolower(pat)) || (tolower($5) ~ tolower(pat)) || (tolower($6) ~ tolower(pat)) || (tolower($7) ~ tolower(pat))' $1 > tmp

	sort -t";" -k3 -d tmp > tmp_sorted

	nlin=`wc -l < tmp_sorted`

	if [ $nlin == 0 ]
	then
		echo "No s'ha trobat cap coincidencia a la base de dades de películes"
	else
		for i in `seq 1 1 $nlin` 
		do
			titol=`head -$i tmp_sorted | tail -1 | cut -d';' -f3`
			any=`head -$i tmp_sorted | tail -1 | cut -d';' -f1`
			long=`head -$i tmp_sorted | tail -1 | cut -d';' -f2`
			pop=`head -$i tmp_sorted | tail -1 | cut -d';' -f8`
			edat=`head -$i tmp_sorted | tail -1 | cut -d';' -f10`
			premis=`head -$i tmp_sorted | tail -1 | cut -d';' -f9`
			tema=`head -$i tmp_sorted | tail -1 | cut -d';' -f4`
			director=`head -$i tmp_sorted | tail -1 | cut -d';' -f7`
			actor=`head -$i tmp_sorted | tail -1 | cut -d';' -f5`
			actriu=`head -$i tmp_sorted | tail -1 | cut -d';' -f6`
			display
		done
	fi

	echo "-------------------------------------------------------------"
	echo "-------------------------------------------------------------"
	echo "QUE VOLDRIES FER ARA?"
	echo " "
	echo "1- Tornar a cercar"
	echo " "
	echo "Qualsevol altre tecla - Tornar al menú"
	echo "-------------------------------------------------------------"
	echo "-------------------------------------------------------------"
	read seleccio
done

rm tmp
rm tmp_sorted
