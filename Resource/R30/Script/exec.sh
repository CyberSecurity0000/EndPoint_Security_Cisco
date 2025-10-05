#!/bin/bash

arq2="message.enc"

ent_arq()
{
	echo -n "# Arquivo (clientinfo.txt): "
	read arq
}

clear
echo -e "\033[01;32m#--------------------#\033[01;00m"
echo -e "\033[01;31m#    CONFIDENCIAL    #\033[01;00m"
echo -e "\033[01;32m#--------------------#\033[01;00m"
echo ""
echo -e "\033[01;32m# [1] Criptografar    \033[01;00m"
echo -e "\033[01;32m# [2] Descriptografar \033[01;00m"
echo -e -n "\n# Opc: "
read opc

if [[ -e $arq2 && $opc -eq 1 ]]
then
	echo "Arquivo encriptado existente !"
	exit 1

else
	case $opc in

	1)
		echo -n "# Arquivo (clientinfo.txt): "
		read arq

		if [[ -e $arq ]]
		then
			openssl aes-256-cbc -pbkdf2 -a -out $arq2 < $arq
		else
			echo "Arquivo inexistente !"
		fi
		;;
	
	2)
		echo -n "# Arquivo ($arq2): "
		read arq

		if [[ -e $arq2 ]]
		then
			openssl aes-256-cbc -d -pbkdf2 -a -in $arq2 -out descriptografado.txt
		else
			echo "Arquivo inexistente !"
		fi
		;;

	*) break;;

	esac
fi
