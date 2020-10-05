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
yinstall kitty # Kitty terminal emulator
install docker
install vim
yinstall code # Visual Studio Code


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

# Setup Kitty
#
KITTY_THEME_NAME=gruvbox_dark
echo "Seeting up Kitty theme $KITTY_THEME_NAME..."
if [ ! -f "$HOME/.config/kitty/kitty-themes/themes/$KITTY_THEME_NAME.conf" ]; then
	echo "Loading Kitty theme from Github..."
	KITTY_THEME_URL="https://raw.githubusercontent.com/dexpota/kitty-themes/master/themes/$KITTY_THEME_NAME.conf"
	wget "$KITTY_THEME_URL" -P "$HOME/.config/kitty/kitty-themes/themes"
fi
if [ -f "$HOME/.config/kitty/theme.conf" ]; then
	rm "$HOME/.config/kitty/theme.conf"
fi
ln -s "$HOME/.config/kitty/kitty-themes/themes/$KITTY_THEME_NAME.conf" "$HOME/.config/kitty/theme.conf"
