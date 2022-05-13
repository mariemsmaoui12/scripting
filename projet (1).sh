#!/bin/bash

function executer_surveiller {
    iostat 5 3 
    sudo iostat 5 3 >> "/var/log/surveillance.log"
    date
    sudo date >> "/var/log/surveillance.log"  
	}

function afficher_utilisation {

	echo "system-monitor :[-m|menu] [-f|free] [-p|ps] [-c|iostat] "
	echo " [-i|list] [-h|help file] [-g|YAD] [-v|version] "

	}


function executer_memoire {
	free
	free >> "/var/log/surveillance.log"
	date
	date >> "/var/log/surveillance.log" 
	}
	
function executer_lister {
	cat "/var/log/surveillance.log"
	}
	
function executer_processus {
	ps --format user,pid,ppid,pid,%mem,pcpu,cmd
	ps --format user,pid,ppid,pid,%mem,pcpu,cmd >> "/var/log/surveillance.log"
    	date
    	date >> "/var/log/surveillance.log"
	}
	
function executer_iostat {
	iostat
	}
		
function lister {
    cat "/var/log/surveillance.log"
	}
	
function executer_readme {
	gedit Readme
	}	

function afficher_menu_graphique {
	    j="..."
    test_=10
    while [ $test_ -ne 4 ]
    do
    action=$(yad --widght 500 --height 500 --title "System Monitor" \
             --button="mémoire:0" \
             --button="Surveiller Périphérique:1"  \
             --button="liste des processus:2" \
             --button="liste des messages:3" \
             --button="Quit:4" \
             --text "$j" --height 100 --widght 100 --scroll)
    test_=$?         
    case $test_ in
        0 )
            j=$(executer_memoire)
            ;;
        1 )
            j=$(executer_surveiller)
            ;;
        2 )
            j=$(executer_processus)
            ;;
        3 )
            j=$(executer_lister)
            ;;
        * )
            ;;
    esac
    done	
	}

function afficher_version {
	echo ""
	echo "(Hardware config) 1.0"
	echo "Copyright@2022 Free Software Foundation"
	echo "Ceci est un logiciel libre. Vous etes libre de le modifier et de le redistribuer."
	echo "Ce logiciel n'est accompagé d'ABSOLUMENT AUCUNE GARANTIE,dans les limites permises par la loi."
	echo "Écrit par omar abderrahmen et mariem smaoui."
	echo ""
	}

function afficher_menu_textuel {
	echo "*Guide d'utilisation Script*"
	echo ""		
	echo "1.[-f] Pour lancer la commande free !"
	echo "2.[-c] Pour lancer la commande iostat !"
	echo "3.[-p] Pour lancer la commande ps !"
	echo "4.[-i] Pour lister les messages de surveillance !"
	echo "5.[-h] Pour lancer la commande help du Script !"
	echo "6.[-g] Pour lancer la commande qui affiche et gère  les fonctionnalité par le menu graphique !"
	echo "7.[-v] Pour afficher le nom des auteurs et versions du code !"
	echo "8.[-m] Pour afficher le menu textuel !"
        echo "0.quitter!"
	read -p "Choisir une option: " choix
	echo ""
	}

case $1 in
 
 -m) 
 	echo ""
 	afficher_menu_textuel
 	        while [ $choix != 0 ]
        do
            case $choix in
                1 )
                    executer_memoire
                    ;;
                2 )
                    executer_iostat
                    ;;
                3 )
                    executer_processus
                    ;;
                4 )
                    executer_lister
                    ;;
                5 )
                    executer_readme
                    ;;
                6 )
                    afficher_menu_graphique
                    ;;
                 7 )
                    afficher_version
                    ;;
                ? )
                    afficher_utilisation
                    ;; 
            esac

 	echo ""
 	afficher_menu_textuel
 	done
 	;;
 	
 -f)
	echo ""
	executer_memoire
	echo ""
	;;
	
  -p)
  	echo ""
  	executer_processus
  	echo ""
   	;;
   		
   -c)
   	echo ""
   	executer_iostat
 	echo ""
   	;;
   		
   -i)	echo ""
	executer_lister
   
     	echo ""
   	;;
   	
   -h)
   	echo ""
   	executer_HELP
   	echo ""
   	;;
   	
   -g)
   	echo ""
   	afficher_menu_graphique
 	echo ""
   	;;
   	
   -v)	
   	echo ""
   	afficher_version
   	echo ""
   	;;
   	
    *)
  	echo ""
  	echo "Aucun argument/commande n'est passé !"
  	echo ""
  	echo "Utiliser l'un des arguments/commandes pour pouvoir utiliser le script selon vos besoins ! "
  	echo ""
  	afficher_utilisation
  	echo ""	
   	;;
esac

