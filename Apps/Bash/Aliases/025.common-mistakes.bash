# !/usr/bin/env bash
# vi:syntax=bash

# ●▬▬▬▬▬๑۩  Aliases ۩๑▬▬▬▬▬●

alias car="cat"
alias CD="cd"
alias hrep="grep"
alias LS="ls"
alias tm="rm"
alias vi="__vi"

# ●▬▬▬▬▬๑۩  Functions ۩๑▬▬▬▬▬●

##### Makes sure you have the right permissions to edit a file
function __vi()
{
	
	# If the file in question does not exist
	if [ ! -e "${1}" ]; then
		if [ ! -w $(dirname "${1}") ]; then
			sudo --preserve-env env vi "${1}"
			return 0
		else
			env vi "${1}"
			return 0
		fi
	fi
	
	# If the file is a dir, exits
	if [ -d "${1}" ]; then
		return 0
	fi
	
	# If the file exists, make sure you have permissions to write it
	if [ ! -w "{1}" ]; then
		sudo --preserve-env env vi "${1}"
	else
		env vi "${1}"
	fi

}
