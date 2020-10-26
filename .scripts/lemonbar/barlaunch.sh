#!/bin/bash

cd ~/.scripts/lemonbar
killall -q lemonbar
./read.sh | lemonbar -p -f iosevka:size=12
