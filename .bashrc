#
# ~/.bashrc
#

source ~/.cache/wal/colors.sh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '

export PATH=/home/cosmo/.scripts:$PATH

(wal -Rqn)
alias poweroff='sudo poweroff'
alias reboot='sudo reboot'
