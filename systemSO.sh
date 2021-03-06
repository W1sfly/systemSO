#!/bin/bash
#date: 09/09/21
#Author W1sfly (Juan Manuel Garcia)

#************************Colores*************************
green="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
turquoise="\e[0;36m\033[1m"
gray="\e[0;37m\033[1m"


ip=$1
test='([1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])'


if [[ $# == 1 && $1 =~ ^$test\.$test\.$test\.$test$ ]]; then


    if [[ $(ping -c 1 $ip | grep ", 0% packet loss" | wc -l) > 0 ]] 
	    then 
		    echo -e "\n${green}La mΓ‘quina estΓ‘ activa${endColour}"  
			
ttl=$(ping -c 1 $ip | grep "ttl=" | cut -d " " -f 6 | sed "s/ttl=//g")

        if [ $ttl -ge 0 -a $ttl -le 64 ]; then
	        echo -e "\nSO ${yellow}-->${endColour} πππππ\n"
        elif
	        [ $ttl -ge 65 -a $ttl -le 128 ]; then
	         echo -e "\nSO ${yellow}-->${endColour} πππππππ\n"
        else
	        echo -e "\nSO ${yellow}-->${endColour} ππππΌπππ/πΌππ\n"
        fi

    else 
		echo -e "\n${red}ERROR, hay fallos en la conectividad\n${endColour}"  				
    fi

else
	echo -e "${yellow}[!]${endColour} UtilizaciΓ³n:\n ${turquoise}*${endColour} ./systemSO.sh IP\n ${turquoise}*${endColour} La IP tiene que tener un formato vΓ‘lido"
fi
