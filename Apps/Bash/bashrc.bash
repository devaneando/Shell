# !/usr/bin/env bash

# If not running interactively, don't do anything
[[ $- == *i* ]] || return

if [ -L "${HOME}/.bashrc" ]; then
	export BASE=`env readlink --canonicalize-missing ${HOME}/.bashrc | /bin/grep --color=never -P "^.*(?=\/Apps)" -o`
    export BASE_BASH="${BASE}/Apps/Bash"
fi

if [ -d "${BASE_BASH}/IncManually" ]; then
    eval `dircolors ${BASE_BASH}/IncManually/dirColors.bash`
fi

if [ -d "${BASE_BASH}/Inc" ]; then
    files=`env find "${BASE_BASH}/Inc" -iname "*.bash" | env sort --ignore-leading-blanks --ignore-case --human-numeric-sort`
	for file in ${files}; do
		source ${file}
	done
fi

if [ -d "${BASE_BASH}/Aliases" ]; then
    files=`env find "${BASE_BASH}/Aliases" -iname "*.bash" | env sort --ignore-leading-blanks --ignore-case --human-numeric-sort`
	for file in ${files}; do
		source ${file}
	done
fi

if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
fi

if [ -f "${HOME}/.bashPrivate" ]; then
	source ${HOME}/.bashPrivate
fi

echo "${FORE_WHITE}`fortune -s`${FORE_RESET}"
