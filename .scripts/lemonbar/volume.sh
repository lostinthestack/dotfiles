#!/bin/bash

pipe=./volume

trap "rm -f $pipe" EXIT

if [[ ! -p $pipe ]]; then
	mkfifo $pipe
fi

while true; do
	state=$(echo -e $(amixer get Master | grep % | cut -d' ' -f8 | tr -d [:punct:]))
	vol=$(echo -e $(amixer get Master | grep % | cut -d' ' -f6 | tr -d [:punct:]))

	if [[ $state == *"off"* ]]
	then
		echo "MUTED" >$pipe
	elif [[ $state == *"on"* ]]
	then
		echo "$vol" >$pipe
	fi
	sleep 1s
done
