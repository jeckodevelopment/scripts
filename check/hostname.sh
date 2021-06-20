#!/bin/bash                                                                                                             
# Request the domain name, checks destination and hostname.
echo "Please type the domain name"

read domain
puntam=$( dig +short $domain )
echo "$puntam"
dig +short -x $puntam
