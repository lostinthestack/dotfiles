#!/bin/bash

pipe=./publicip

trap "rm -f $pipe" EXIT

if [[ ! -p $pipe ]]; then
	mkfifo $pipe
fi

while true; do
	echo -e "$(curl icanhazip.com)" >$pipe
	sleep 10s
done

