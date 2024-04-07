#!/bin/bash


clear

nlin=`wc -l < $1`

linea=`echo $[ $RANDOM % $nlin + 3 ]` #Agafa un nombre aleatori de linea a partir de la linea 3 (per evitar la capçalera)

a=`head -1 $1 | cut -d";" -f1`
b=`head -2 $1 | tail -1 | cut -d";" -f1`
if [ $nlin -eq 0 ]
then
	echo "La base de dades de pel·lícules es buida, aquesta opció no esta disponible"          #Tota aquesta part es per evitar arxius sense películes o arxius que continguin només la capçalera
elif  [[ $a == 'Year' ]] && [[ $b == 'INT' ]] && [[ $nlin -eq 2 ]]
then
	echo "L'arxiu introduit no conté pel·lícules, aquesta opció no esta disponible"
else
	clear				  
	display () {

		echo "*************************************************************"
		echo " "
		echo "3.1 - Ha guanyat algun premi la pel·lícula ... ?"
		echo " "
		echo "*************************************************************"
		echo " "
		echo "-------------------------------------------------------------"
		echo "Títol: $titol"
		echo "Any: $any    Longitud: $long   Popularitat: $pop"
		echo "Edat minima:$edat   Premis: ?    Tema: $tema"
		echo "Director: $director"
		echo "Actor: $actor"
		echo "Actriu: $actriu"
		echo "-------------------------------------------------------------"
		echo " "
		echo "Respostes possibles:"
		echo "Yes  No"
		echo " "
		echo "Escriu la resposta correcta:"
	}



	titol=`head -$linea $1 | tail -1 | cut -d';' -f3`
	any=`head -$linea $1 | tail -1 | cut -d';' -f1`
	long=`head -$linea $1 | tail -1 | cut -d';' -f2`
	pop=`head -$linea $1 | tail -1 | cut -d';' -f8`
	edat=`head -$linea $1 | tail -1 | cut -d';' -f10`
	premis=`head -$linea $1 | tail -1 | cut -d';' -f9`
	tema=`head -$linea $1 | tail -1 | cut -d';' -f4`
	director=`head -$linea $1 | tail -1 | cut -d';' -f7`
	actor=`head -$linea $1 | tail -1 | cut -d';' -f5`
	actriu=`head -$linea $1 | tail -1 | cut -d';' -f6`

	display
	read resposta

	if [ $resposta == $premis ]
	then
		echo "Resposta correcta, FELICITATS!"
	else
		echo "Resposta incorrecta."
		echo "La resposta correcta era $premis"
	fi
fi
