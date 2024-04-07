#!/bin/bash
clear
# file;Year;Length;Title;subject;Actor;Actress;Director;Popularity;Awards;ParentalGuide

a=`awk -F";" -v tit="$4" -v anio="$2" -v dir="$8" '($3 == tit) && ($7 == dir) && ($1 == anio) {print NR}' $1`  #Con este script de awk buscamos una linea con un patron en especifico (para hacer mas optima la comparacion buscamos unicamente el número de línea).
nada=""


#Si el número de linea buscado es igual a nada implica que no esta en el archivo, por lo tanto lo añade a este, en caso de que si encuentre una similitud solo se imprime un mensaje avisando de que la pelicula ya existe.
if [[ $a -eq $nada ]];
then
	echo "$2;$3;$4;$5;$6;$7;$8;$9;${10};${11}" >> $1
	echo "El registre s'ha afegit correctament"
else
	echo "No s'ha afegit cap registre: la pel·lícula ja existeix"

fi
