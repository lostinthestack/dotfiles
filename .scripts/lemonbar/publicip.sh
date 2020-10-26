#!/bin/bash

pipe=./publicip

trap "rm -f $pipe" EXIT

#if [[ ! -p $pipe ]]; then
#	mkfifo $pipe
#fi

while true; do
	echo -e "<PUBLICIP_MOD1>$(curl icanhazip.com)<PUBLICIP_MOD2>" >$pipe
	sleep 10s
done

