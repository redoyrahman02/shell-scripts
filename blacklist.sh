#!/bin/bash
input="/var/www/blacklist/malware.txt"
while IFS= read -r line
do
  sudo iptables -D INPUT -s $line -p tcp --destination-port 80 -j DROP
  sudo iptables -D INPUT -s $line -p tcp --destination-port 443 -j DROP
 sudo iptables -A INPUT -s $line -p tcp --destination-port 80 -j DROP
  sudo iptables -A INPUT -s $line -p tcp --destination-port 443 -j DROP
done < "$input"

sudo service iptables save
