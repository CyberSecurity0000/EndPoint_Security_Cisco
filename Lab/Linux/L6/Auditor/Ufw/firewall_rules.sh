#!/bin/bash

iptables -F
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport ssh -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -j DROP
iptables -I INPUT 1 -i lo -j ACCEPT
iptables-save
iptables -L -v
ufw enable
