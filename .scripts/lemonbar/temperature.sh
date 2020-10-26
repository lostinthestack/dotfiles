#!/bin/bash

pipe=./temperature

trap "rm -f $pipe" EXIT

#if [[ ! -p $pipe ]]; then
#	mkfifo $pipe
#fi

while true; do
	echo -e "<TEMPERATURE_MOD1>$(sensors | grep lake -A2 | grep temp | cut -d: -f2 | tr -d '[:space:]')<TEMPERATURE_MOD2>" >$pipe
	sleep 20s
done
