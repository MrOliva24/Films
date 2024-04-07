#!/bin/bash

clear
#Agafem el nombre de files i generem un nombre aleatori per agafar el director aleatori i imprimir-lo per pantalla
nlin=`wc -l < $1`
directorrandom=""
a=`head -1 $1 | cut -d";" -f1`
b=`head -2 $1 | tail -1 | cut -d";" -f1`
if [ $nlin -eq 0 ]
then
	echo "La base de dades de pel·lícules es buida, aquesta opció no esta disponible"
elif  [[ $a == 'Year' ]] && [[ $b == 'INT' ]] && [[ $nlin -eq 2 ]]
then
	echo "L'arxiu introduit no conté pel·lícules, aquesta opció no esta disponible"
else
	while [[ $directorrandom == "" ]]
	do
		numdict=$(( $RANDOM % $nlin + 3 ))
		directorrandom=`head -$numdict $1 | tail -1 | cut -d';' -f7`
	done


	#Agafem totes les files del document de les pel·lícules i contem quantes hi ha 
	grep "$directorrandom" $1 > pelisactor.txt
	numreal=`wc -l < pelisactor.txt`

	#Jo personalment he volgut que el màxim dels valors aleatoris pugui ser el doble del real, d'aquesta manera, no serà tant pla com un número de l'1 al 10 per exemple-
	#Així, si un director realment té 2 pelis, sortiran valors fins a 4, en canvi un que hagi fet 20, podrà sortir fins a 40. 
	doble=0
	let doble=$numreal+$numreal+1

	#Inicialitzem els valors aleatoris
	random1=$(( $RANDOM % $doble + 1 ))
	random2=$(( $RANDOM % $doble + 1 ))

	#Fem processos de comparació per verificar que no hi hagi cap valor repetit.

	while [[ $random1 -eq $random2 || $numreal -eq $random1 || $numreal -eq $random2 ]];
	do
		random1=$(( $RANDOM % $doble + 1 ))
		random2=$(( $RANDOM % $doble + 1 ))
	done



	#Fem que pugui estar en qualsevol posició qualsevol possibilitat, per fer-ho, associem a la resposta correcta el número 3, al numero aleatorio 1 l'1 i al 2 el 2.
	#Per explicar tot aquest procés faré servir passos en l'explicació perquè sigui més entenedor.

#Primer: iniciem les variables amb 3 valors aleatoris entre 1 i 3
	numpos1=$(( $RANDOM % 3 + 1 ))
	numpos2=$(( $RANDOM % 3 + 1 ))
	numpos3=$(( $RANDOM % 3 + 1 ))

#Segon: Fins que no siguin tots 3 diferents, no surt del bucle while
	while [[ $numpos1 -eq $numpos2 || $numpos1 -eq $numpos3 || $numpos3 -eq $numpos2 ]];
	do
		numpos2=$(( $RANDOM % 3 + 1 ))
		numpos3=$(( $RANDOM % 3 + 1 ))
	done

#Tercer: Fem comparacions en funció dels nombres anteriors per introduïr a l'arxiuordenat els valors possibles que surtiran a la terminal.
	if [[ $numpos1 -eq 1 ]];
	then
		echo $random1 > arxiuordenat
	fi	

	if [[ $numpos2 -eq 1 ]];
	then
		echo $random2 > arxiuordenat
	fi

	if [[ $numpos3 -eq 1 ]];
	then
		echo $numreal > arxiuordenat
	fi


	if [[ $numpos1 -eq 2 ]];
	then
		echo $random1 >> arxiuordenat
	fi	

	if [[ $numpos2 -eq 2 ]];
	then
		echo $random2 >> arxiuordenat
	fi

	if [[ $numpos3 -eq 2 ]];
	then
		echo $numreal >> arxiuordenat
	fi

	if [[ $numpos1 -eq 3 ]];
	then
		echo $random1 >> arxiuordenat
	fi	

	if [[ $numpos2 -eq 3 ]];
	then
		echo $random2 >> arxiuordenat
	fi

	if [[ $numpos3 -eq 3 ]];
	then
		echo $numreal >> arxiuordenat
	fi

#Agafem els valors de l'arxiu en funció de la seva posició, que equivalen a les variables numreal, 
	numord1=`head -1 arxiuordenat | tail -1`
	numord2=`head -2 arxiuordenat | tail -1`
	numord3=`head -3 arxiuordenat | tail -1`

	#Fem els prints 
	echo "------------------------------------------------------------------"
	echo " "
	echo "3.2 - Quantes pel·lícules ha dirigit el director $directorrandom ?"
	echo " "
	echo "------------------------------------------------------------------"
	echo " "
	echo "Director: $directorrandom"
	echo " "
	echo "Respostes possibles:"
	echo " "
	echo "$numord1, $numord2, $numord3"
	echo " "
	echo "Escriu la resposta correcte:"
	echo " "
	read solucio #Fem un read per llegir la opció triada pel jugador o usuari.



#Comparem la variable solució agafada del read amb el valor de la variable que té la solució real (numreal) i donem la resposta necessària

	if [[ $solucio -eq $numreal ]]
	then
		echo "Felicitats, has encertat!"
	fi

	if [[ $solucio -ne $numreal ]]
	then
		echo "Oh no, t'has equivocat! La resposta correcte era: $numreal"
	fi

	rm arxiuordenat
	rm pelisactor.txt
fi



