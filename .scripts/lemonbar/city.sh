#!/bin/bash

pipe=./city

trap "rm -f $pipe" EXIT

#if [[ ! -p $pipe ]]; then
#	mkfifo $pipe
#fi

while true; do
	echo -e "<CITY_MOD1>$(curl ipinfo.io | grep city | cut -d'"' -f4)<CITY_MOD2>" >$pipe
	sleep 10s
done
