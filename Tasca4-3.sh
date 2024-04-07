#!/bin/bash

display () {
	echo "-------------------------------------------------------------"
	echo "Títol: $titol"
	echo "Any: $any    Longitud: $long_n   Popularitat: $pop_n"
	echo "Edat minima:$edat_n   Premis: $premis_n    Tema: $tema_n"
	echo "Director: $director"
	echo "Actor: $actor_n"
	echo "Actriu: $actriu_n"
	echo "-------------------------------------------------------------"

}

# $2 titol $3 any $4 longitud $5 popularitat $6 edat $7 premis $8 tema $9 director $10 actor $11 actriu

nada=""
linea=`awk -F";" -v tit="$2" -v anio="$3" -v dir="$9" '($3 == tit) && ($7 == dir) && ($1 == anio) {print NR}' $1` #Cerca del número de linia que es vol substituir en base al títol l'any i el director

if [[ $linea -eq $nada ]]
then
	echo "No s'ha modificat cap registre:"
	echo "Les dades no coincideixen amb cap pelicula a la base de dades"
else
	titol=`head -$linea $1 | tail -1 | cut -d';' -f3`
	any=`head -$linea $1 | tail -1 | cut -d';' -f1`
	long=`head -$linea $1 | tail -1 | cut -d';' -f2`
	pop=`head -$linea $1 | tail -1 | cut -d';' -f8`
	edat=`head -$linea $1 | tail -1 | cut -d';' -f10`               #Declaracio de les variables ja existents en el arxiu
	premis=`head -$linea $1 | tail -1 | cut -d';' -f9`
	tema=`head -$linea $1 | tail -1 | cut -d';' -f4`
	director=`head -$linea $1 | tail -1 | cut -d';' -f7`
	actor=`head -$linea $1 | tail -1 | cut -d';' -f5`
	actriu=`head -$linea $1 | tail -1 | cut -d';' -f6`


	long_n=$4; pop_n=$5; edat_n=$6; premis_n=$7; tema_n=$8; actor_n=${10}; actriu_n=${11}  #Declaracio de les variables a sustituir
	
	igual="="

	if [ $4 == "=" ]
	then
		long_n=$long
	fi
	if [ $5 == "=" ]
	then
		pop_n=$pop
	fi
	if [ $6 == "=" ]
	then
		edat_n=$edat
	fi
	if [ $7 == "=" ]					#Canvi del signe "=" per la dada ja existent en les variables necessàries.
	then
		premis_n=$premis
	fi
	if [ $8 == "=" ]
	then
		tema_n=$tema
	fi
	if [ ${10} == "=" ]
	then
		actor_n=$actor
	fi
	if [ ${11} == "=" ]
	then
		actriu_n=$actriu	
	fi

	declare -a oldvars=( "$long" "$pop" "$edat" "$premis" "$tema" "$actor" "$actriu" )
	declare -a newvars=( "$long_n" "$pop_n" "$edat_n" "$premis_n" "$tema_n" "$actor_n" "$actriu_n" )  #Declaració de dos arrays amb les variables a buscar i substituir
	
	for i in `seq 0 1 6`
	do

		sed -i "${linea}s/${oldvars[i]}/${newvars[i]}/g" $1	 #Reemplaçament de les variables
	done
	
	echo "Pel·lícula modificada amb èxit"
	echo " " 
	echo "El nou registre és el seguent:"
	echo " "
	display
fi
