#!/bin/bash

JSON=$(for i in `cat /etc/zabbix/scripts/domain_ex.txt`; do printf "{\"{#DOMAIN_EX}\":\"$i\"},"; done | sed 's/^\(.*\).$/\1/')
printf "{\"data\":["
printf "$JSON"
printf "]}"
