#!/bin/bash

sudo sv stop NetworkManager
sudo macchanger -r wlp2s0 -p
#sleep 2s
sudo sv start NetworkManager

