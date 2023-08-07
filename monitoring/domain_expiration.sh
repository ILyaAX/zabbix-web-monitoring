#!/bin/bash

DOMAIN="$1"
wdate=`whois $DOMAIN | grep -E 'paid|Expire|Expiry|Expiration'`

exdate=`echo $wdate | grep -m 1 -o -E '[0-9]{4}.[0-9]{2}.[0-9]{2}'`
if [[ $exdate == "" ]]; then 
	exdate=`echo $wdate | grep -m 1 -o -E '[0-9]{2}.[0-9]{2}.[0-9]{4}' | sed -E 's/([0-9]{2}).([0-9]{2}).([0-9]{4})\b/\3-\2-\1/g'`
fi

expire=$((`date -d "$exdate" '+%s'`))
today=$((`date '+%s'`))
leftsec=$(($expire - $today))
leftdays=$(($leftsec/86400))
echo $leftdays
