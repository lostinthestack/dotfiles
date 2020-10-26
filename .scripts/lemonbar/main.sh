#!/bin/bash

cd ~/.scripts/lemonbar

pipe=./main

trap "rm -f $pipe" EXIT

#if [[ ! -p $pipe ]]; then
#	mkfifo $pipe
#fi

Run(){
	./battery.sh wait &
	./city.sh wait &
	./clock.sh wait &
	./mac.sh wait &
	./memory.sh wait &
	./publicip.sh wait &
	./temperature.sh wait &
	./volume.sh wait &
}

KillRun(){
	killall -q battery.sh 
	killall -q city.sh 
	killall -q clock.sh 
	killall -q mac.sh 
	killall -q memory.sh 
	killall -q publicip.sh 
	killall -q temperature.sh 
	killall -q volume.sh 
}

trap KillRun EXIT

Run

while true; do
	echo -e "$(cat battery)$(cat city)$(cat clock)$(cat mac)$(cat memory)$(cat publicip)$(cat temperature)$(cat volume)" >$pipe
	sleep 1s
done
