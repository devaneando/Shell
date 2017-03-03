#! /usr/bin/env bash

reset

export BASE=`env readlink --canonicalize-missing $0 | env grep --color=never -P "^.*(?=\/install)" -o`

source "${BASE}/.install/functions.bash"
source "${BASE}/.install/installMain.bash"
source "${BASE}/.install/installPackages.bash"
