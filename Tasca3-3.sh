#!/bin/bash

tail +3 $1 > filmsordretitol
lin=`wc -l < filmsordretitol`				#Añadimos todas las lineas que contengan peliculas al fichero filmsordretitol, posteriormente contamos las lineas y guardamos ese numero en una variable, donde finalmente ejecutamos un comando para que escoja un numero al 								azar de este mismo numero.
a=`head -1 $1 | cut -d";" -f1`
b=`head -2 $1 | tail -1 | cut -d";" -f1`

if [ $lin -eq 0 ]
then
	clear
	echo "La base de dades de pel·lícules es buida, aquesta opció no esta disponible"
elif  [[ $a == 'Year' ]] && [[ $b == 'INT' ]] && [[ $lin -eq 2 ]]
then													#Tota aquesta part es per evitar arxius sense películes o arxius que continguin només la capçalera
	clear
	echo "L'arxiu introduit no conté pel·lícules, aquesta opció no esta disponible"
else
	clear
	ran=`echo $(($RANDOM%$lin))`

	titol=`head -$ran filmsordretitol | tail -1 | cut -d';' -f3`
	any=`head -$ran filmsordretitol | tail -1 | cut -d';' -f1`
	long=`head -$ran filmsordretitol | tail -1 | cut -d';' -f2`
	pop=`head -$ran filmsordretitol | tail -1 | cut -d';' -f8`
	edat=`head -$ran filmsordretitol | tail -1 | cut -d';' -f10`
	premis=`head -$ran filmsordretitol | tail -1 | cut -d';' -f9`
	tema=`head -$ran filmsordretitol | tail -1 | cut -d';' -f4`
	director=`head -$ran filmsordretitol | tail -1 | cut -d';' -f7`
	actor=`head -$ran filmsordretitol | tail -1 | cut -d';' -f5`
	actriu=`head -$ran filmsordretitol | tail -1 | cut -d';' -f6`

	display () {


		
		echo "*************************************************************"
		echo " "
		echo "3.3 - Quin és el génere de la pel·lícula ... ? "
		echo " "
		echo "*************************************************************"
		echo " " 
		echo "-------------------------------------------------------------"
		echo "Títol: $titol"
		echo "Any: $any    Longitud: $long   Popularitat: $pop"
		echo "Edat minima:$edat   Premis: $premis    Tema: ?"
		echo "Director: $director"
		echo "Actor: $actor"
		echo "Actriu: $actriu"
		echo "-------------------------------------------------------------"

	}

	display
	echo " "
	
	#Ahora añadimos al fichero tmp2 los temas posibles de las peliculas, ordenados alfabeticamente, y contamos el numero de lineas y lo añadimos a la variable temas para asi poder crear un bucle for que vaya imprimiendo los temas posibles.

	tail +3 $1 | sort -k4 -t";" | cut -d";" -f4 | sort -u | tail +2 > tmp2
	temas=`wc -l < tmp2`
	i=0
	for k in `seq 1 $temas`
	do
		let i=i+1
		tema_display=`head -$k tmp2 | tail -1`
		echo "$i.- $tema_display"
	done
	
	#Posteriormente leemos la opcion escrita por el usuario y buscamos ese tema, si este es igual al escrito en el archivo SS-films.csv entonces se imprimira un mensaje felicitando el acierto, en caso contrario indicara que el usuario se ha equivocado y mostrara el tema 		correcto de la pelicula.
	
	echo " "
	echo "Selecciona una opcio [1,2,3...]"
	read opcio

	res=`head -$opcio tmp2 | tail -1`

	echo " "

	if [ $res == $tema ]
	then
		echo "Felicitats, l'has encertat"
	else
		echo "No, t'has equivocat, el tema era: $tema"
	fi

	rm filmsordretitol
fi

