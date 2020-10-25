#!/bin/bash

# Define $pipe as named output file of mkfifo.
pipe=./clock

# Set script to delete output file on exit.
trap "rm -f $pipe" EXIT

# If output file does NOT exist, then create it.
if [[ ! -p $pipe ]]; then
	mkfifo $pipe
fi

# While loop for main body of script.
while true; do
	# Main information to be manipulated.
	clock=$(date "+%I:%M:%S")
	# Send info into output file in order to be later read, parsed, styled, and piped into statusbar (LemonBar).
	echo -e "$clock" >> TEST
	sleep 1s
done

