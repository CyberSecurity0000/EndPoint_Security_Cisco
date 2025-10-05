#!/bin/bash

arq="hashes.txt"

# Unshadow
clear
unshadow /etc/passwd /etc/shadow > $arq

# Comando
john --format=crypt --wordlist=Wordlist/password.lst $arq

# Ver senhas Quebradas
echo "---------------------------"
cat /root/.john/john.pot
echo "---------------------------"

echo -e "\n---------------------------"
echo -e "# Senhas:\n$(john --show $arq)"
echo -e "---------------------------"
