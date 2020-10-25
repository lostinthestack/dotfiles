#!/bin/bash

pipe=./mac

trap "rm -f $pipe" EXIT

if [[ ! -p $pipe ]];then
	mkfifo $pipe
fi

while true; do
	Permanent=$(sudo macchanger -s wlp2s0 | grep Perm | awk -F' ' '{print $3}')
	Current=$(sudo macchanger -s wlp2s0 | grep Curr | awk -F' ' '{print $3}')

	if [[ $Current == $Permanent ]];then
		echo -e "$Current NSA is watching!" >$pipe
		mac.sh
	elif [[ $Current != $Permanent ]];then
		echo -e "$Current" >$pipe
	fi
	sleep 10s
done

