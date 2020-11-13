#!/bin/sh

source ./helpers.sh

install htop htop

if command -v npm &> /dev/null
then
	if ! command -v gtop &> /dev/null
	then
		npm install -g gtop
	fi
fi

yinstall 1password

