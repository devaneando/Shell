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

# If set, a command name that is the name of a directory is executed as if it were the argument to the cd command.
shopt -s autocd

# If set, minor errors in the spelling of a directory component in a cd command will be corrected.
shopt -s cdspell

# If set, Bash replaces directory names with the results of word expansion when performing filename completion.
shopt -s direxpand

# If set, Bash attempts spelling correction on directory names during word completion if the directory name
# initially supplied does not exist.
shopt -s dirspell

# If set, Bash includes filenames beginning with a ‘.’ in the results of filename expansion.
shopt -s dotglob
