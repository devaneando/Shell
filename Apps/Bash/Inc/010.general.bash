# !/usr/bin/env bash
# vi:syntax=bash

# Check http://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
#       https://bash.cyberciti.biz/guide/Setting_shell_options

# Use less command as a pager
export PAGER=less

# Set vim as default text editor
export EDITOR=vim
export VISUAL=vim
export SVN_EDITOR="$VISUAL"

# Store 5000 commands in history buffer
export HISTSIZE=100000

# Store 5000 commands in history FILE 
export HISTFILESIZE=100000      

# Ignores duplicates and spaces in history
export HISTCONTROL=ignoredups:erasedups:ignorespace

# Avoid duplicates in history and other useless things
export HISTIGNORE='&:[ ]*:car*:CD*:clear*:exit*:pwd*:reset*:..*'

# If set, Bash attempts spelling correction on directory names during word completion if the directory name initially supplied does not exist.
shopt -q -s dirspell

# Correct dir spellings
shopt -q -s cdspell

# CD is assumed by default
shopt -q -s autocd  

# Make sure display get updated when terminal window get resized
shopt -q -s checkwinsize

# Turn on the extended pattern matching features 
shopt -q -s extglob

# Append rather than overwrite history on exit
shopt -q -s histappend

# If set, and Readline is being used, a user is given the opportunity to re-edit a failed history substitution.
shopt -q -s histreedit

# the results of history substitution are not immediately passed to the shell parser. Instead, the resulting line
# is loaded into the Readline editing buffer, allowing further modification.
shopt -q -s histverify

# Make multi-line commandsline in history
shopt -q -s cmdhist 

# Get immediate notification of background job termination
set -o notify 

# Disable [CTRL-D] which is used to exit the shell
set -o ignoreeof

# Disable core files
ulimit -S -c 0 > /dev/null 2>&1
