#!/bin/bash

nlin=`wc -l < $1`

sort -k3 -t';' $1 > filmssortedalpha

display(){
	echo "*******************************"
	echo "Titol: $titol"
	echo "Any: $any    Longitud: $long     Popularitat: $pop"
	echo "Edat mínima: $edat   Premis: $premis   Tema: $tema"
	echo "Director: $director"
	echo "Actor: $actor"
	echo "Actriu: $actriu"
}

for i in `seq 1 1 $nlin`
do 
	titol=`head -$i filmssortedalpha | tail -1 | cut -d';' -f3`
	any=`head -$i filmssortedalpha | tail -1 | cut -d';' -f1`
	long=`head -$i filmssortedalpha | tail -1 | cut -d';' -f2`
	pop=`head -$i filmssortedalpha | tail -1 | cut -d';' -f8`
	edat=`head -$i filmssortedalpha | tail -1 | cut -d';' -f10`
	premis=`head -$i filmssortedalpha | tail -1 | cut -d';' -f9`
	tema=`head -$i filmssortedalpha | tail -1 | cut -d';' -f4`
	director=`head -$i filmssortedalpha | tail -1 | cut -d';' -f7`
	actor=`head -$i filmssortedalpha | tail -1 | cut -d';' -f5`
	actriu=`head -$i filmssortedalpha | tail -1 | cut -d';' -f6`
	display
done
rm filmssortedalpha
