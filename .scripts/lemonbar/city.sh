#!/bin/bash

pipe=./city

trap "rm -f $pipe" EXIT

if [[ ! -p $pipe ]]; then
	mkfifo $pipe
fi

while true; do
	echo -e "$(curl ipinfo.io | grep city | cut -d'"' -f4)" >$pipe
	sleep 10s
done
