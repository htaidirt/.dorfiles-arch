#!/bin/bash

source ./helpers.sh

install libreoffice-still libreoffice
yinstall thunderbird-bin thunderbird
yinstall notion-app notion-app
yinstall zoom zoom

# LibreOffice requirements
# https://wiki.archlinux.fr/LibreOffice
#
install ttf-dejavu ttf-dejavu
install hunspell hunspell
install hunspell-fr hunspell-fr
install libpaper libpaper

# Enforces A4 format
if command -v paperconfig &> /dev/null
then
	sudo paperconfig -p a4
fi

