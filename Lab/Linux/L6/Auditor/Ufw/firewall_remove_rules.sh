#!/bin/bash

sudo iptables -F       # limpa regras de todas as chains (INPUT, OUTPUT, FORWARD)
sudo iptables -X       # remove chains customizadas
sudo iptables -t nat -F
sudo iptables -t nat -X
sudo iptables -t mangle -F
sudo iptables -t mangle -X
sudo iptables -t raw -F
sudo iptables -t raw -X
sudo iptables -t security -F
sudo iptables -t security -X
