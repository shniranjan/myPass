#!/bin/bash

#check dependent package installed or not
if [ -z $(which xclip) ]; then
	echo 'Required package (xclip) not installed.  Aboarting installation...'
	sleep 2
	exit 1
fi
if [ -z $(which openssl) ]; then
	echo 'Required package (openssl) not installed.  Aboarting installation...'
	sleep 2
	exit 1
fi

#check if genpass exists, if not download
if [ ! -f '/usr/local/bin/myPass' ] ; then
	wget https://raw.githubusercontent.com/shniranjan/myPass/master/myPass -O /usr/local/bin/myPass  && chmod +x /usr/local/bin/myPass && echo "Installation successful" && exit 0
fi
