#!/bin/bash

nlin=`wc -l < $1`

sort -t';' -k10 $1 > films_sorted


display () {
	echo "-------------------------------------------------------------"
	echo "Títol: $titol"
	echo "Any: $any    Longitud: $long   Popularitat: $pop"
	echo "Edat minima: $edat   Premis: $premis   Tema: $tema"
	echo "Director: $director"
	echo "Actor: $actor"
	echo "Actriu: $actriu"
}

for i in `seq 1 1 $nlin` 
do
	titol=`head -$i films_sorted | tail -1 | cut -d';' -f3`
	any=`head -$i films_sorted | tail -1 | cut -d';' -f1`
	long=`head -$i films_sorted | tail -1 | cut -d';' -f2`
	pop=`head -$i films_sorted | tail -1 | cut -d';' -f8`
	edat=`head -$i films_sorted | tail -1 | cut -d';' -f10`
	premis=`head -$i films_sorted | tail -1 | cut -d';' -f9`
	tema=`head -$i films_sorted | tail -1 | cut -d';' -f4`
	director=`head -$i films_sorted | tail -1 | cut -d';' -f7`
	actor=`head -$i films_sorted | tail -1 | cut -d';' -f5`
	actriu=`head -$i films_sorted | tail -1 | cut -d';' -f6`
	display
done
rm films_sorted
