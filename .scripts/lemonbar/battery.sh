#!/bin/bash

cd ~/.scripts/lemonbar

pipe=./battery

trap "rm -f $pipe" EXIT

#if [[ ! -p $pipe ]];then
#	mkfifo $pipe
#fi

while true; do
	battinfo=$(echo -e "acpi -b")
	battperc=$($battinfo | cut -d, -f2 | tr -d [:punct:][:space:])
	case $battperc in
		[0-9]|[1][0-9]|[2][0-5])	echo "<BATTERY_MOD1>$battperc RED<BATTERY_MOD2>" > $pipe		;;
		[2][6-9]|[3-4][0-9]|[50])	echo "<BATTERY_MOD1>$battperc YELLOW<BATTERY_MOD2>" > $pipe	;;
		[5-6][0-9]|[7][0-5])		echo "<BATTERY_MOD1>$battperc ORANGE<BATTERY_MOD2>" > $pipe	;;
		[7][6-9]|[8-9][0-9]|[100])	echo "<BATTERY_MOD1>$battperc GREEN<BATTERY_MOD2>" > $pipe		;;
	esac
	sleep 1m
done
