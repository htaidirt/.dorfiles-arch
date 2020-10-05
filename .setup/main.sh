#!/bin/bash

# sudo pacman -Syu
# sudo pacman-key --refresh-keys

source ./helpers.sh

sudo pacman-mirrors -f 3 # Select 3 fastest mirrors for downloads

install yay
install neofetch
install conky


# Setup yay
#
if command -v yay &> /dev/null
then
    yay --save --answerclean All --answerdiff All
fi

# Notes:
# 1. Make sure to add conky autostart in ~/.config/autostart/conky.desktop to start on reboot
