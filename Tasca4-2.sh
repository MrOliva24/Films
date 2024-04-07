#!/bin/bash

#Es calcula el nombre de línies que més tard farem servir per la comprovació de si s'ha trobat una pel·lícula o no
nlin=`wc -l < $1`


#Inicialitzem les variables
i=3
trobat=3
trobatinicial=3
head -1 $1 | tail -1 > arxiupelieliminada.csv
head -2 $1 | tail -1 >> arxiupelieliminada.csv

#Comença el bucle
while [[ $i -le $nlin ]]
do 
	#En cada iteració agafa les variables requerides per fer les comparacions
	titol=`head -$i $1 | tail -1 | cut -d';' -f3`
	any=`head -$i $1 | tail -1 | cut -d';' -f1`
	director=`head -$i $1 | tail -1 | cut -d';' -f7`
	#Fa les comparacions, on cal que qualsevol de les 3 condicions es compleixi per entrar a dins del if i afegir la línia de la pel·lícula al fitxer
	if [ "$titol" != "$2" ] || [ "$any" -ne "$3" ] || [ "$director" != "$4" ];
	then
				head -$i $1 | tail -1 >> arxiupelieliminada.csv
				let trobat=$trobat-1
	fi
	let i=$i+1
	let trobat=$trobat+1
done

#Agafem el nombre de línies de l'arxiu
nlineli=`wc -l < arxiupelieliminada.csv`

#Per tal de que es reiniciï l'arxiu, pasem amb una redirecció simple la primera línia de text
head -1 arxiupelieliminada.csv | tail -1 > $1
#Amb un bucle while pasem tota la resta de línies de text a l'arxiu final, que serà el mateix que ens han passat com a argument al començament
k=2
while [[ $k -le $nlineli ]]
do
	head -$k arxiupelieliminada.csv | tail -1 >> $1
	let k=k+1
done
#Per tal de mantenir un millor ordre al repositori, suprimim l'arxiu extern que hem fet servir durant l'script
rm arxiupelieliminada.csv

#Finalment, si el nombre de línies de l'arxiu inicial és el mateix, imprimirà el primer missatge que mostra que no s'ha trobat la pel·lícula, en canvi, si no és el mateix, mostra que s'ha eliminat la peli indicada
if [[ $trobat -eq $trobatinicial ]]
then
	echo "No s'ha trobat una pel·lícula amb les 3 condicions introduïdes"
else
	echo "S'ha eliminat la pel·lícula desitjada"
fi

