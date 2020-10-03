#!/bin/bash

function install() {
	if ! command -v $1 &> /dev/null
	then
		echo "Installing $1 using pacman..."
		sudo pacman -S $1 --noconfirm
	fi
}

function yinstall() {
	if ! command -v $1 &> /dev/null
	then
		echo "Installing $1 using yay [AUR]..."
		yay -S $1 --noconfirm
	fi
}


