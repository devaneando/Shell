# !/usr/bin/env bash
# vi:syntax=bash

##### History settings
export HISTSIZE=100000
export HISTFILESIZE=100000       
export HISTCONTROL=ignoredups:erasedups:ignorespace
export HISTIGNORE="car*:CD*:clear*:exit*:pwd*:reset*:..*"
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

shopt -s histappend    
shopt -s cmdhist         
shopt -s histverify
shopt -s autocd        
shopt -s dirspell         
shopt -s cdspell          
shopt -s checkwinsize
