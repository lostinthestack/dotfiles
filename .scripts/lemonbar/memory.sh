#!/bin/bash

pipe=./memory

trap "rm -f $pipe" EXIT

if [[ ! -p $pipe ]];then
	mkfifo $pipe
fi

while true; do
	total=$(free -h --si | grep Mem | awk -F' ' '{print $2}')
	used=$(free -h --si | grep Mem | awk -F' ' '{print $3}')

	echo -e "$used | $total" >$pipe
	sleep 20s
done

