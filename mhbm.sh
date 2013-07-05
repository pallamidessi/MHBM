#!/bin/bash
	erase_flag=0
	ignore_flag=0
	OPTIND=1
	BUFFERNAME=$1
	#path="$HOME/.mhbm/"

	while  getopts "d:ieph" opt ; do
		case $opt in
			d)
				if [  -f $HOME/.mhbm/$OPTARG ]; then
					rm $HOME/.mhbm/$OPTARG
				fi
				return
				;;
			i)
				ignore_flag=1
				;;
			e)
				erase_flag=1
				;;
			#p)
			#path=
			#	;;
			h)
				man $HOME/MHBM/.mhbm;
				return
				;;
			\?)

				;;
		esac
		
	done
	history -c;
	
	if [ $ignore_flag -eq 1 -a $erase_flag -eq 1 ]; then
		export HISTCONTROL=""
		BUFFERNAME=$3
	elif [ $ignore_flag -eq 1 ]; then
		export HISTCONTROL=erasedups;
		BUFFERNAME=$2
	elif [ $erase_flag -eq 1 ]; then
		export HISTCONTROL=ignoredups;
		BUFFERNAME=$2
	else
		export HISTCONTROL=erasedups:ignoredups;
	fi

	shopt -s histappend
	
	if [ $BUFFERNAME = "default" ]; then
		history -r ;
		export PROMPT_COMMAND="history -a ";
		export PS1="`cat $HOME/.mhbm/ps1`";
	else
		if [ ! -d $HOME/.mhbm ]; then
			mkdir $HOME/.mhbm
		fi

		if [ ! -f $HOME/.mhbm/$BUFFERNAME ]; then
			touch $HOME/.mhbm/$BUFFERNAME;
			echo $1 > $HOME/.mhbm/$BUFFERNAME;
			history -r "$HOME/.mhbm/$BUFFERNAME" ;
		else 
			history -r "$HOME/.mhbm/$BUFFERNAME" ;
		fi
		export PROMPT_COMMAND="history -n $HOME/.mhbm/$BUFFERNAME;history -w $HOME/.mhbm/$BUFFERNAME;history -c $HOME/.mhbm/$BUFFERNAME;history -r $HOME/.mhbm/$BUFFERNAME";
		export PS1="`cat $HOME/.mhbm/ps1`\[\033[31m\]$BUFFERNAME\[\033[0m\] ";
	fi





