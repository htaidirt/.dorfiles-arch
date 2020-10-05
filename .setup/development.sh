#!/bin/bash

source ./helpers.sh

# Setup git
#
git config --global user.name "Hassen Taidirt"
git config --global user.email "htaidirt@gmail.com"


# Setup SSH if not set
#
if [ ! -f "$HOME/.ssh/id_rsa" ]; then
	echo "SSH Keygen not set, please take time to create one..."
	ssh-keygen -C "$(whoami)@$(uname -n)-$(date -I)"
fi


# Install development tools
#
install vim
install alacritty
install docker
yinstall code # Visual Studio Code


# Enable docker on reboot
#
if ! command -v docker &> /dev/null
then
	sudo systemctl start docker.service
	sudo systemctl enable docker.service
	sudo usermod -aG docker $USER # Run docker as current user (no sudo)
	# Make sure to reboot after this
	echo "[WARNING] reboot is required to run docker with current user"
fi

