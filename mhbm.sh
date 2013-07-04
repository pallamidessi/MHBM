#!/bin/bash

	history -c;

	export HISTCONTROL=erasedups;
	export HISTCONTROL=ignoredups;
	
	shopt -s histappend
	
	if [ $1 = "default" ]; 
	then
		history -r  ;
		export PROMPT_COMMAND="history -a ";
		export PS1="`cat $HOME/.mhbm/ps1`";
	else
		if [ ! -d $HOME/.mhbm ]; 
		then
			mkdir $HOME/.mhbm
		fi

		if [ ! -f $HOME/.mhbm/$1 ]; 
		then
			touch $HOME/.mhbm/$1;
			echo $1 > $HOME/.mhbm/$1;
			history -r "$HOME/.mhbm/$1" ;
		else 
			history -r "$HOME/.mhbm/$1" ;
		fi
		export PROMPT_COMMAND="history -n $HOME/.mhbm/$1;history -w $HOME/.mhbm/$1;history -c $HOME/.mhbm/$1;history -r $HOME/.mhbm/$1";
		export PS1="`cat $HOME/.mhbm/ps1`\033[31m[$1]\033[0m ";
	fi





