#!/bin/bash

if [ ! -d $HOME/.mhbm ]; then
	mkdir $HOME/.mhbm
fi

cp mhbm.sh /usr/local/bin

if [ ! -f $HOME/.bashrc ]; then
	touch $HOME/.bashrc		
fi


echo 'echo "$PS1" > ~/.mhbm/ps1' >> $HOME/.bashrc
echo "alias mhbm='source /usr/local/bin/mhbm.sh'" >> $HOME/.bashrc
echo 'export PATH=$PATH:/usr/local/bin' >> $HOME/.bashrc

if [ ! -d /usr/local/man/man7/  ]; then
	mkdir /usr/local/man/man7/ 
fi

install -g 0 -o 0 -m 0644 mhbm.7 /usr/local/man/man7/
gzip /usr/local/man/man7/mhbm.7



