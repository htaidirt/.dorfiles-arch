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
install alacritty # Alacritty terminal emulator
install docker
install vim
if ! command -v code &> /dev/null; then
  yinstall visual-studio-code-bin # Visual Studio Code (official from MS)
fi


# Install programming languages
#
if ! command -v node &> /dev/null; then
  yinstall nvm
fi


# Enable docker on reboot
# TODO: Make this works only once.
#
# if ! command -v docker &> /dev/null
# then
# 	sudo systemctl start docker.service
# 	sudo systemctl enable docker.service
# 	sudo usermod -aG docker $USER # Run docker as current user (no sudo)
# 	# Make sure to reboot after this
# 	echo "[WARNING] reboot is required to run docker with current user"
# fi

# Install and configure SpaceVIM
#
if [ ! -f "$HOME/.SpaceVim.d/init.toml" ]; then
	curl -sLf https://spacevim.org/install.sh | bash
fi

