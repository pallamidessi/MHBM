#!/bin/bash

if [ ! -d $HOME/.mhbm ]; then
	mkdir $HOME/.mhbm
fi

cp mhbm.sh /usr/local/bin

if [ ! -f $HOME/.bashrc ]; then
	touch $HOME/.bashrc		
fi


echo' echo "$PS1" > ~/.mhbm/ps1 
alias mhbm=\'source /usr/local/bin/mhbm.sh\'
export PATH=$PATH:/usr/local/bin
' > $HOME/.bashrc

install -g 0 -o 0 -m 0644 mhbm /usr/local/man/man8/
gzip /usr/local/man/man8/mhbm

source $home/.bashrc


