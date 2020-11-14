#!/bin/sh

source ./helpers.sh

install htop htop
install flameshot flameshot

if command -v npm &> /dev/null
then
	if ! command -v gtop &> /dev/null
	then
		npm install -g gtop
	fi
fi

yinstall 1password 1password
yinstall ltunify ltunify # Helps to connect to my MX Anywhere 2

