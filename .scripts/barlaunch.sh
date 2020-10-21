#!/bin/bash
. ~/.cache/wal/colors.sh
killall -q lemonbar
bar.sh | lemonbar -p -f hack -o 1 -f iosevka:size=24 -o 10 -g 1920x20 -B$color0 -F$color8

