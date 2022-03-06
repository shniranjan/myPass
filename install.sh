#!/bin/bash

#check dependent package installed or not
if [ -z $(which xclip) ]; then
	echo 'Required package (xclip) not installed.  Aboarting installation...'
	sleep 2
	exit 1

if [ -z $(which openssl) ]; then
	echo 'Required package (openssl) not installed.  Aboarting installation...'
	sleep 2
	exit 1


#check if genpass exists, if not download
[ ! -f myPass ] && wget https://raw.githubusercontent.com/shniranjan/myPass/master/myPass -O /usr/local/bin/myPass  && chmod +x myPass && echo "Installation successful"

#enable executable
#chmod +x myPass
#copy genpass into bin directory
#sudo cp ./myPass /usr/local/bin

exit 0
