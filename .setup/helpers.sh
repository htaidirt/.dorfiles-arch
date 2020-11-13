#!/bin/bash

function install() {
	if ! command -v $2 &> /dev/null
	then
		echo "Installing $1 using pacman..."
		sudo pacman -S $1 --noconfirm
	fi
}

function yinstall() {
	if ! command -v $2 &> /dev/null
	then
		echo "Installing $1 using yay [AUR]..."
		yay -S $1
	fi
}

function yuninstall() {
	yay -Rns $1
}

