#!/usr/bin/env bash

export SHELLCHECK_OPTS="-e SC1090"

# If not running interactively, don't do anything
[[ $- == *i* ]] || return

# Finds what is the base path of the Shell config files
if [ -L "${HOME}/.bashrc" ]; then
    export BASE
    BASE=$(env readlink --canonicalize-missing ${HOME}/.bashrc | /bin/grep --color=never -P "^.*(?=\/Apps)" -o)
    export BASE_BASH="${BASE}/Apps/Bash"
fi

# Specify here any files you need to be included
if [ -d "${BASE_BASH}/IncManually" ]; then
    eval "$(dircolors ${BASE_BASH}/IncManually/dirColors.bash)"
fi

# Includes all automatic "automatic" files
if [ -d "${BASE_BASH}/Inc" ]; then
    files=$(env find "${BASE_BASH}/Inc" -iname "*.bash" | env sort --ignore-leading-blanks --ignore-case --human-numeric-sort)
    for file in ${files}; do
        source ${file}
    done
fi

# Includes all aliases
if [ -d "${BASE_BASH}/Aliases" ]; then
    files=$(env find "${BASE_BASH}/Aliases" -iname "*.bash" | env sort --ignore-leading-blanks --ignore-case --human-numeric-sort)
    for file in ${files}; do
        source ${file}
    done
fi

# Makes sure bash completion is enabled
if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
fi

# This file requires the exeution of this command:
# $ composer global require stecman/composer-bash-completion-plugin dev-master
if [ -f ${HOME}/.composer/vendor/stecman/composer-bash-completion-plugin/hooks/bash-completion ]; then
    source ${HOME}/.composer/vendor/stecman/composer-bash-completion-plugin/hooks/bash-completion
fi

# Add custom changes
if [ -f "${HOME}/.bashPrivate" ]; then
    source ${HOME}/.bashPrivate
fi

# Displays a nice fortune
if [ -f /usr/games/fortune ]; then
    echo "${FORE_WHITE}$(fortune -s)${FORE_RESET}"
fi
