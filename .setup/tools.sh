#!/bin/sh

source ./helpers.sh

if command -v npm &> /dev/null
then
	if ! command -v gtop &> /dev/null
	then
		npm install -g gtop
	fi
fi
