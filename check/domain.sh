#!/bin/bash
echo "------------------------------------------------------------------"
echo "Insert a domain name"
read dominio
echo "------------------------------------------------------------------"
echo "RESULTS"
echo "------------------------------------------------------------------"
echo "NAMESERVERS"
puntam=$( dig +short $dominio )
host -t ns $dominio
echo "------------------------------------------------------------------"
echo "HOSTNAME"
echo "$puntam"
dig +short -x $puntam
echo "------------------------------------------------------------------"
echo "REGISTRAR"
whoisresult=$(whois $dominio)
#regist=$(echo "$whoisresult" | grep -i 'REG' | wc -l)
isitdom=$(echo "$dominio" | grep -i '.it' | wc -l)
itreg=$(echo "$whoisresult" | grep 'REG' | tr -d 'Name:')
        if [ "$isitdom" -gt "0" ]
                then
                        echo "$dominio is registered at $itreg"
                fi
                if [ "$isitdom" -eq "0" ]
                        then
                        echo "$whoisresult" | grep 'Reseller:'
                        echo "$whoisresult" | grep 'Registrar:'
                fi
echo "------------------------------------------------------------------"
echo "EMAIL"
dig +short -t mx $dominio
echo "SPF"
dig +short -t txt $dominio | grep "spf"
echo "------------------------------------------------------------------"
