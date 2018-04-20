##### HISTORY
############################################################################

# Append insted rewriting
shopt -s histappend

# Allowing a bigger history size
HISTFILESIZE=1000000
HISTSIZE=1000000

# Ignore duplicated lines and the ones starting with a space
HISTCONTROL=ignoreboth

# Ignore these commands
HISTIGNORE='ls:la:bg:fg:cd:reset:history'

# Change multilined commands into a single one
shopt -s cmdhist

##### User Experience
############################################################################

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will match all files and
# zero or more directories and subdirectories.
shopt -s globstar
