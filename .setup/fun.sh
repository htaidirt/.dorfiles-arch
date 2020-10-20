#!/bin/sh

source ./helpers.sh

install cmake

# Install Tmatrix
#
if ! command -v tmatrix &> /dev/null
then
	ORIGIN=$(pwd)
	TMP="$HOME/TMP"
	mkdir -p $TMP && cd $TMP
	git clone https://github.com/M4444/TMatrix.git
	cd TMatrix
	mkdir -p build && cd build
	cmake ..
	make -j8
	sudo make install
	cd $ORIGIN
	rm "$TMP/TMatrix"
fi

