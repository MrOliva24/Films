David Ruiz Cáceres 1672891
Adrian Prego Gallart 1672251
Marc Roig Oliva 1668300

LLIURAMENT CODI PART A

15/11/2022
Com a primer pas de la pràctica s'ha creat una branca anomenada "Opcio-Menu" en la que s'ha generat un script que fa funcionar el menú principal, amb una funció "menu" que genera el text i un bucle que habilita les funcions del menu (com que encara no estan definides l'script retorna el text "En desenvolupament" o opció no valida en cas que s'apreti qualsevol tecla que no sigui una de les opcions disponibles)

18/11/2022
Pel desenvolupament de la tasca 1 s'han escrit els tres scripts de forma individual i posteriorment s'han pujat un per un al repositori remot fent push de les branques Opcio1-x despres s'ha fet el merge amb la branca Opcio 1 i per ultim s'ha fusionat Opcio-1 amb master, previemant haven fet un commit a master per mantenir la estructura del gràfic.


01/12/2022
S'han desenvolupat els scripts corresponents a la Opcio-2, i s'ha actualitzat el repositori remot fent diferents merge de la branca opcio-2 amb les branques opcio2-x de cada integrant per posteriorment fusionarles amb master i donar per finalitzat el projecte

Hem tingut problemes per fusionar les branques, com la corrupció d'arxius objecte del propi git. Tot i això, els scripts funcionen correctament.

RESUM DEL CODI:
	
	El codi funciona amb scripts externs fet individualment per els diferents integrants del grup, que després mitjançant el github s'han pogut posar en comú. Cadascú ha pogut treballar de forma remota i simultànea. La primera tasca exigía molt menys nivell que la segona, la qual sí que ens ha costat realment dur a terme. 
	
INSTRUCCIONS:
	Executar l'arxiu Films.sh amb un arxiu de text de peliculas separat pel caràcter ; com a paràmetre.
	
	Posteriorment, l'usuari haurà d'anar seguint les instruccions que apareixen per pantalla.
	
	Primer haurà de escollir quina opció vol que realitzi el programa, i dins d'aquesta, escollir la tasca a executar.
	
	Finalment, després de passar els valors o caràcters necessaris, tindrà l'opció de tornar al menú per poder escollir una altra funció, o repetir la mateixa (prement l'1).
	
PROBLEMES:
	Hi ha hagut dos principals problemes:
		1.- Relacionat amb la eina git: un portàtil es va quedar sense bateria a meitat d'un procés generant arxius corruptes i malformant la fusió de branques. Es va solucionar clonant el repositori en una carpeta externa i tornant a fusionar les branques.
		
		2.- Relacionat amb la programació: com fer que la cerca no fos sensible a les majúscules i minúscules que es va solucionar aprenent awk.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

LLIURAMENT CODI PART B


13/12/2022
Finalitzades les tres subtasques de la tasca 3 (La tasca 3-3 tot i estar desenvolupada per Adrian Prego el commit esta fet per Marc Roig ja que en el moment de fer els push Adrian estava malalt).
S'han fusionat les branques Opcio3-x amb Opcio-3 i posteriorment aquesta s'ha fusionat amb master.  S'han arreglat els scripts perque eliminin tots els arxius temporals que generen i s'han eliminat manualment els que quedaven al repositori.
Els scripts funcionen correctament per tant donem la Tasca 3 per acabada.

16/12/2022
Finalitzades les tres substasques de la tasca 4.
S'han fusionat les branques amb opcio-4 i aquesta amb master. 
Hem pogut veure que ara tenim molta més pràctica a l'hora de fer els merge, commits, pulls i pushes, i creiem que es pot veure reflectit en el github, comparant la forma del gràfic a la tasca 2 amb la de les tasques 3 i 4.
Els scripts funcionen correctament per tant es dona la Tasca 4 per acabada
S'ha finalitzat la practica afegint el codi necessari al scrpit general "films.sh" per tal de que el programa sencer s'executi sense problemes

20/12/2022
Hem dedicat l'última sessió per revissar tots els scripts i possibles errors que ens puguin aparèixer en funció del tipus d'arguments que s'introdueixin. També ens hem possat a editar l'arxiu README, per tal de deixar-ho ja enllestit. Hem comprovat que funcionen correctament si introdueixes lletres en comptes de números o viceversa, i també si introdueixes espais blancs. 

RESUM DEL CODI:
	
	A l'igual que a la part A, el codi fa servir scripts externs fet individualment per els diferents integrants del grup, que després mitjançant el github s'han pogut posar en comú. Cadascú ha pogut treballar de forma remota i simultànea. 
	El codi mostra per pantalla els menús necessaris perquè l'usuari pugui accedir a qualsevol script. Una vegada es crida a l'script en qüestió, l'arxiu films.sh demana, en cas que sigui necessaris, els arguments pertinents, i crida als subscripts fets invidualment. 
	Una vegada s'executa l'script, s'imprimeix per pantalla un missatge mostrant el procés que s'ha fet:
	
	TASCA 3:
		3-1: Mostra les dades d'una pel·lícula i pregunta si té o no té premis. En funció de la resposta introduïda per l'usuari, mostra un missatge felicitant-lo, o dient que la resposta correcta era l'altre.
		3-2: Mostra el nom del director i pregunta quantes pel·lícules a dirigit. Per fer-ho, es guarda el resultat correcte a una variable i agafa 2 valors aleatoris més. Després, fa un read per llegir la opció escollida per l'usuari. Si és correcta, el felicita, en cas contrari, indicada la opció que era correcta.
		3-3: Mostra totes les dades d'una pel·lícula aleatoria excepte el tema, i després mostra tots els temes possibles ordenats alfabèticament. L'usuari escull un número dels que surt a la llista on es mostra el tema associat, i en funció de si és el correcte, felicita al jugador, o mostra el que era el resultat real.
	TASCA 4:
		4-1: Et demana totes les dades d'una pel·lícula (que s'introdueixen per reads, obtenint variables que després es passen com arguments) i busca la coincidència a l'arxiu SS-films.csv, en cas de trobar-ho, ho indicava per pantalla, si no, l'afegia a l'arxiu. 
		4-2: Et demana el nom, l'any i el director d'una pel·lícula (que s'introdueixen per reads, obtenint variables que després es passen com arguments) i si troba una coincidència a l'arxiu SS-films.csv, el suprimeix de l'arxiu. 
		4-3: La funció d'aquest script és modificar una entrada de l'arxiu SS-films.csv. Per fer-ho, et demana totes les dades d'una pel·lícula (que s'introdueixen per reads, obtenint variables que després es passen com arguments). Aquestes dades seràn les que es canviïn a l'entrada de la pel·lícula. Per això, si es vol deixar la mateixa dada en un dels apartats, s'introdueix un signe =.
		
INSTRUCCIONS:
	Executar l'arxiu Films.sh amb un arxiu de text de peliculas.
	
	Posteriorment, l'usuari haurà d'anar seguint les instruccions que apareixen per pantalla.
	
	Primer haurà de escollir quina opció vol que realitzi el programa, i dins d'aquesta, escollir la tasca a executar.
	
	Una vegada s'executa la tasca es torna al menú on estava.
	
	Finalment, després de passar els valors o caràcters necessaris, tindrà l'opció de tornar al menú per poder escollir una altra funció, o repetir la mateixa (prement l'1).
	
PROBLEMES:
	1.- El día 16 vam editar el fitxer films.sh perquè es puguessin executar els scripts de la tasca 3 i 4, però no vam fer el push addient al final de la classe perquè qualsevol integrant del grup puguès seguir, amb la mala sort de que la persona que tenía l'script es va posar malalta per la següent classe. Per tant hem hagut de fer altres coses (com aquest script) per poder 		avançar alguna cosa.
	2.- En comparació a les tasques 1 i 2, els scripts han pujat de dificultat, i evidentment ens han costat més de trobar la forma de fer que funcionin. Tot i això, hem aconseguit superar aquest incovenient.
CONCLUSIONS:
	Tot i haver tingut dificultats, i haver-nos organitzat malament a la tasca 2, estem orgullosos del resultat final. En els gràfics del github es pot veure com han millorat, i a més, els scripts funcionen correctament. 
	A més, no només ens ha agradat la pràctica, sinò que realment sentim que hem aprés. Hem guanyat confiança i agilitat a l'hora de moure'ns a nivell local pel directori i també a l'hora de modificar el repositori remot. 

CONCLUSIONS PERSONALS:
	DAVID: Crec que he aprés molt, ja no només a fer scripts en bash sinò que també a treballar en grup amb l'eina github. Tot i que a la primera part se'm va oblidar fer proves per si els inputs 
	no eren del tipus correcte i això es va veure reflectit a la nota, crec que haver fet la consulta per la nota ha sigut molt avantatjós per saber possibles errors de cara a l'última part.
	ADRIÁN: Personalmente lo más importante ha sido el trabajo en grupo que hemos realizado, sobre todo a la hora de solucionar problemas y buscar otros métodos diferentes para llegar a los objetivos de los enunciados propuestos.
	MARC: Considero que la implementació de la practica ha tingut un impacte molt positiu no només en la meva forma de programar o en l'aprenentatge de la eina git (que al principi va ser tot un repte per a mi) sino que ha tingut un gran impacte la part del treball en grup, 		sobretot en la resolució de problemes de manera conjunta i en la barreja de les opinions de tots els integrants per intentar buscar una solució als problemes.

