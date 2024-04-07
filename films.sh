#!/bin/bash
clear
###MENU###
menu () {

    cat menu.txt
    echo ""
    echo "//////////////////////////////////////////"
    echo ""
    echo "Introdueix la opció desitjada"

}


enDesenvolupament () {
    clear
    echo "En desenvolupament"
    echo "Prem enter per continuar"
    read useless
    clear
}


opcioNoValida () {
    clear
    echo "Opcio no vàlida"
    sleep 3
    clear 
}

#Year;Length;Title;subject;Actor;Actress;Director;Popularity;Awards;ParentalGuide

readvars () {
	echo "Introdueix l'any de sortida de la película"
	read any
	echo " " 
	echo "Introdueix la longitud de la pel·lícula en minuts"
	read long
	echo " "
	echo "Introdueix el títol de la película"
	read titol 
	echo " "
	echo "Introdueix el tema de la película"
	read tema
	echo " "
	echo "Introdueix l'actor principal de la película"
	read actor
	echo " "
	echo "Introdueix l'actriu principal de la pel·lícula"
	read actriu
	echo " "
	echo "Introdueix la popularitat de la película de l'1 al 100"
	read pop
	echo " " 
	echo "Ha tingut premis la pel·lícula"
	read premis
	echo " "
	echo "Quina es la edat mínima recomendada per veure la pel·lícula?"
	read edat
	echo " "
	echo "Qui va dirigir la pel·lícula?"
	read director
	echo " "
	echo "Espera mentre cerquem a la base de dades"
	sleep 2
	clear
		
}



menu

read opcio
clear

while [ $opcio != 0 ]
do
	if [ $opcio == 1 ] 
	then
		clear
		cat display-Opcio1
		read opcio1
		bash ./Tasca1-$opcio1.sh $1
		echo " "
		echo "Prem qualsevol tecla per sortir"
		read useless
		clear        	
		menu

	elif [ $opcio == 2 ] 
	then
		clear
		cat display-Opcio2
		read opcio2
		bash ./Tasca2-$opcio2.sh $1
		echo " "
		echo "Prem qualsevol tecla per sortir"
		read useless
		clear        	
		menu
        
	elif [ $opcio == 3 ] 
	then
		clear
		cat display-Opcio3
		read opcio3
		case $opcio3 in						#Fem us del case per executar l'script demanat, si es demana el 0 tornem al menu principal i si es demana qualsevol altre caracter es crida a la funció "opcioNoValida"
			"0")
			clear
			;;
			"1")
			./Tasca3-1.sh $1
			echo " "											
			echo "Prem qualsevol tecla per sortir"
			read useless
			;;
			"2")
			./Tasca3-2.sh $1
			echo " "
			echo "Prem qualsevol tecla per sortir"
			read useless
			;;
			"3") 
			./Tasca3-3.sh $1
			echo " "
			echo "Prem qualsevol tecla per sortir"
			read useless
			;;
			*)
			opcioNoValida
			;;
		esac
		clear
		menu


	elif [ $opcio == 4 ] 
	then
		clear
		cat display-Opcio4
		read opcio4
		clear
		case $opcio4 in 
			"1")
			readvars
			./Tasca4-1.sh $1 $any $long $titol $tema $actor $actriu $director $pop $premis $edat
			echo " "														#Fem us d'un "case" similar al anterior pero aquesta vegada com que els scripts necessiten variables hem inclòs una funció anomenada 
																		#"readvars" per llegir les variables necessàries i axí evitar repetir el codi varies vegades.
			echo "Prem qualsevol tecla per sortir"
			read useless
			;;
			"2")
			echo "Introdueix l'any de sortida de la película"
			read any
			echo " "
			echo "Introdueix el títol de la película"
			read titol
			echo " "
			echo "Qui va dirigir la pel·lícula?"
			read director
			echo "Espera mentre cerquem a la base de dades"
			sleep 2
			clear
			./Tasca4-2.sh $1 $titol $any $director
			echo " "
			echo "Prem qualsevol tecla per sortir"
			read useless
			;;
			"3")
			readvars
			./Tasca4-3.sh $1 $titol $any $long $pop $edat $premis $tema $director $actor $actriu
			echo " "
			echo "Prem qualsevol tecla per sortir"
			read useless
			;;
			"0")
			clear
			;;
			*)
			opcioNoValida
			;;
		esac
		clear
		menu 

	else
		opcioNoValida
		menu
	fi

	read opcio

done
clear
