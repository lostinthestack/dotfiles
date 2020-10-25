#!/bin/bash

pipe=./main

trap "rm -f $pipe" EXIT

if [[ ! -p $pipe ]]; then
	mkfifo $pipe
fi

while true; do
	echo -e "$(cat clock) $(cat volume)" >$pipe
	sleep 1s
done
