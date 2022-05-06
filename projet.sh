#!/bin/bash



function HELP
{
	cat /home/omar/Bureau/script/help.txt
}

function MEMO_USAGE
{
	date +%Y-%m-%d/%H:%M >> log.txt | sudo cp log.txt /var/log/surveillance.log
	free -t >> log.txt | sudo cp log.txt /var/log/surveillance.log
	free -t

}


function CPU
{
	date +%Y-%m-%d/%H:%M >> log.txt | sudo cp log.txt /var/log/surveillance.log
	ps au | ps -af >> log.txt | sudo cp log.txt /var/log/surveillance.log
	ps au | ps -af
}




function DISPLAY_LOG
{
	cat /var/log/surveillance.log
}





function WHOs_AUTHOR
{
	ll /home/omar/bureau/script/projet.sh
}





function TEXT_MENU
{
	echo "		/***************** MENU ***********************************************************/ 
		1/ Affiche les quantités totales de mémoire et de zone de swap libres et utilisées
		2/ Surveiller la charge d'entrée/sortie des périphériques
		3/ Affiche une liste des processus en cours d'exécution
		4/ Lister les messages de surveillance		
		5/ Afficher le help
		6/ Afficher auteur
		7/ Afficher menu graphique
		0/ Quitter
		/***************** END OF MENU ***************************************************/"
}





 while getopts ":fcplhgvm" option
  do
          echo "Executing .. $option"
          case $option in
		f)
			MEMO_USAGE
			;;
		c)
			DEVICE_STATS
			;;
		p)
			CPU
			;;
		l)
			DISPLAY_LOG
			;;
		h)
			HELP
			;;	
		v)
			WHOs_AUTHOR
                       ;;
		m)
			TEXT_MENU
			m=0
			while (m==0)
			do
			echo "Choisir de la menu:"
			read m
			case $m in
				1)
					MEMO_USAGE
					;;
				2)
					DEVICE_STATS
					;;
				3)
					CPU
					;;
				4)
					DISPLAY_LOG
					;;
				5)
					HELP
					;;
				6)
					WHOs_AUTHOR
					;;
				7)
					GRAPH_MENU
					;;
				0)
					exit 0
					;;
			esac
			done
			;;
	g)
			GRAPH_MENU
			foo=$?
			if [[ $foo -eq 1 ]]; then ./free.sh && ./projet.sh -g
			elif [[ $foo -eq 2 ]]; then ./iostat.sh && ./projet.sh -g
			elif [[ $foo -eq 3 ]]; then ./ps.sh && ./projet.sh -g
			fi
			;;

			
			
			
          esac
          done
          
	
