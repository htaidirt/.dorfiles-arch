#!/bin/bash

source ./helpers.sh

install libreoffice-still
yinstall notion-app

# LibreOffice requirements
# https://wiki.archlinux.fr/LibreOffice
#
install ttf-dejavu
install hunspell
install hunspell-fr
install libpaper

if command -v paperconfig &> /dev/null
then
	sudo paperconfig -p a4
fi

