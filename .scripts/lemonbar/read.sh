#!/bin/bash

source ~/.cache/wal/colors.sh

b1a="<BATTERY_MOD1>"
b1b="<BATTERY_MOD2>"
b2a="<CITY_MOD1>"
b2b="<CITY_MOD2>"
b3a="<CLOCK_MOD1>"
b3b="<CLOCK_MOD2>"
b4a="<MAC_MOD1>"
b4b="<MAC_MOD2>"
b5a="<MEMORY_MOD1>"
b5b="<MEMORY_MOD2>"
b6a="<PUBLICIP_MOD1>"
b6b="<PUBLICIP_MOD2>"
b7a="<TEMPERATURE_MOD1>"
b7b="<TEMPERATURE_MOD2>"
b8a="<VOLUME_MOD1>"
b8b="<VOLUME_MOD2>"

r1a="%{F$foreground B$color1}"
r1b="%{F-B-}"
r2a="%{F$foreground B$color2}"
r2b="%{F-B-}"
r3a="%{F$foreground B$color3}"
r3b="%{F-B-}"
r4a="%{F$foreground B$color4}"
r4b="%{F-B-}"
r5a="%{F$foreground B$color5}"
r5b="%{F-B-}"
r6a="%{F$foreground B$color6}"
r6b="%{F-B-}"
r7a="%{F$foreground B$color1}"
r7b="%{F-B-}"
r8a="%{F$foreground B$color8}"
r8b="%{F-B-}"

while true; do
	echo -e "$(cat main)" | sed "s,$b1a,$r1a,g" | sed "s,$b1b,$r1b,g" | sed "s,$b2a,$r2a,g" | sed "s,$b2b,$r2b,g" | sed "s,$b3a,$r3a,g" | sed "s,$b3b,$r3b,g" | sed "s,$b4a,$r4a,g" | sed "s,$b4b,$r4b,g" | sed "s,$b5a,$r5a,g" | sed "s,$b5b,$r5b,g" | sed "s,$b6a,$r6a,g" | sed "s,$b6b,$r6b,g" | sed "s,$b7a,$r7a,g" | sed "s,$b7b,$r7b,g" | sed "s,$b8a,$r8a,g" | sed "s,$b8b,$r8b,g"

	sleep 1s
done

