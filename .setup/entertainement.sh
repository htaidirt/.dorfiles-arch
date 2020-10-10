#!/bin/bash

source ./helpers.sh

yinstall spotifyd
yinstall spotify-tui

systemctl --user enable spotifyd --now
# For a better understanding on configuring spotifyd and spotify-tui
# visit https://www.rockyourcode.com/spotify-in-the-terminal-with-spotify-tui-and-spotifyd/

