#!/usr/bin/env bash
# vi:syntax=bash

# Check http://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
#       https://bash.cyberciti.biz/guide/Setting_shell_options

# Use less command as a pager
export PAGER=less

# Set vim as default text editor
export EDITOR=vim
export VISUAL=vim
export SVN_EDITOR="$VISUAL"

# Store 100000 commands in history buffer
export HISTSIZE=100000

# Store 100000 commands in history FILE
export HISTFILESIZE=100000

# Ignores duplicates and spaces in history
export HISTCONTROL=ignoredups:erasedups:ignorespace

# Avoid duplicates in history and other useless things
export HISTIGNORE='&:[ ]*:car*:CD*:cd*:clear*:exit*:pwd*:reset*:..*:whoami:whereis*:man*:history*:exit'

# If set, Bash attempts spelling correction on directory names during word completion if the directory name initially supplied does not exist.
shopt -q -s dirspell

# Correct dir spellings
shopt -q -s cdspell

# If set, Bash replaces directory names with the results of word expansion when performing filename completion.
shopt -q -s direxpand

# CD is assumed by default
shopt -q -s autocd

# Make sure display get updated when terminal window get resized
shopt -q -s checkwinsize

# Turn on the extended pattern matching features
shopt -q -s extglob

# If set, and Readline is being used, Bash will not attempt to search the PATH for possible completions when completion is attempted on an empty line.
shopt -q -s no_empty_cmd_completion

# Append rather than overwrite history on exit
shopt -q -s histappend

# Make multi-line commandsline in history
shopt -q -s cmdhist

# Get immediate notification of background job termination
set -o notify

# Disable [CTRL-D] which is used to exit the shell
set -o ignoreeof

# Disable core files
ulimit -S -c 0 >/dev/null 2>&1
