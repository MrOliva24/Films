#!/bin/bash

seleccio=1
while [ $seleccio == 1 ]
do
	echo "Introdueix edat"
	read edatfiltre
	echo "Introdueix el tema a escollir entre: Science Fiction, War, Action, Fantasy, Comedy, Drama, Mystery, Westerns, Music, Short, Adventure or Horror"
	read temafiltre

	display(){
		echo "*******************************"
		echo "Titol: $titol"
		echo "Any: $any    Longitud: $long     Popularitat: $pop"
		echo "Edat mínima: $edat   Premis: $premis   Tema: $tema"
		echo "Director: $director"
		echo "Actor: $actor"
		echo "Actriu: $actriu"
	}

	sort -k1 -t';' $1 > filmsordretitol
	nlin=`wc -l < $1`
	i=3
	trobat=False
	while [[ $i -le $nlin ]]
	do
		if [[ `head -$i filmsordretitol | tail -1 | cut -d';' -f4` == $temafiltre ]];
		then
			if [[ `head -$i filmsordretitol | tail -1 | cut -d';' -f10` -le $edatfiltre ]];
			then
				titol=`head -$i filmsordretitol | tail -1 | cut -d';' -f3`
				any=`head -$i filmsordretitol | tail -1 | cut -d';' -f1`
				long=`head -$i filmsordretitol | tail -1 | cut -d';' -f2`
				pop=`head -$i filmsordretitol | tail -1 | cut -d';' -f8`
				edat=`head -$i filmsordretitol | tail -1 | cut -d';' -f10`
				premis=`head -$i filmsordretitol | tail -1 | cut -d';' -f9`
				tema=`head -$i filmsordretitol | tail -1 | cut -d';' -f4`
				director=`head -$i filmsordretitol | tail -1 | cut -d';' -f7`
				actor=`head -$i filmsordretitol | tail -1 | cut -d';' -f5`
				actriu=`head -$i filmsordretitol | tail -1 | cut -d';' -f6`
				display
				Trobat=True
			fi
		fi
		let i=$i+1
	done 

	if [[ $Trobat == False ]];
	then
		echo "Pel·lícula no trobada"
	fi
rm filmsordretitol
echo " "
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
