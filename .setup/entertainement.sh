#!/bin/bash

source ./helpers.sh

yinstall spotify spotify
# In case of error due to not found GPG key, run the following:
# gpg --keyserver pool.sks-keyservers.net --recv-keys <gpg key>
# And run `yay -S spotify` again

yinstall spotifyd spotifyd
yinstall spotify-tui spt

systemctl --user enable spotifyd --now
# For a better understanding on configuring spotifyd and spotify-tui
# visit https://www.rockyourcode.com/spotify-in-the-terminal-with-spotify-tui-and-spotifyd/

yay discord discord

