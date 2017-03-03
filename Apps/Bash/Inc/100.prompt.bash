#!/usr/bin/env bash
# vim:set syntax=sh:

__prompt_command()
{
	local exitStatus=$?

	PS1_ITALIC='\[\e[3m\]'	
	PS1_NO_ITALIC='\[\e[23m\]'
	PS1_RESET='\[\e[0m\]'
	

	if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
		PS1_SYMBOL='\[\e[92m\]'
		PS1_TIME='\[\e[32m\]'
		PS1_HOST='\[\e[32m\]'
		PS1_GIT='\[\e[92m\]'
		PS1_FOLDER='\[\e[92m\]'
		PS1_OK='\[\e[32m\]'
		PS1_NOK='\[\e[31m\]'		
	else
		PS1_SYMBOL='\[\e[96m\]'
		PS1_TIME='\[\e[34m\]'
		PS1_HOST='\[\e[34m\]'
		PS1_GIT='\[\e[96m\]'
		PS1_FOLDER='\[\e[94m\]'
		PS1_OK='\[\e[32m\]'
		PS1_NOK='\[\e[31m\]'
	fi

	# The time
	PS1="${PS1_ITALIC}${PS1_TIME}\A ${PS1_NO_ITALIC}"

	# The git repository
	gitRepository="$(/usr/bin/git rev-parse --abbrev-ref HEAD 2>/dev/null)";
    if [ -n "$gitRepository" ]; then
        PS1+="${PS1_ITALIC}${PS1_GIT}[${gitRepository}] ${PS1_NO_ITALIC}"
    fi
	
	# The hostname of the machine
	PS1+="${PS1_ITALIC}${PS1_HOST}\h${PS1_NO_ITALIC}"
	
	# The divider
	PS1+="${PS1_ITALIC}${PS1_SYMBOL}@${PS1_NO_ITALIC}"
	
    # The folder
	PS1+="${PS1_ITALIC}${PS1_FOLDER}\W ${PS1_NO_ITALIC}"
	
	if [ $exitStatus -eq 0 ]; then
		PS1+="${PS1_SYMBOL} ${PS1_OK}:)${PS1_RESET} "
	else
		PS1+="${PS1_SYMBOL} ${PS1_NOK}:(${PS1_RESET} "
	fi

    # Appends history data
    history -a
    history -c
    history -r
	
}

export PROMPT_COMMAND=__prompt_command
