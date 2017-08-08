#! /usr/bin/env bash

reset

export BASE
BASE=`env readlink --canonicalize-missing $0 | env grep --color=never -P "^.*(?=\/install)" -o`

source "${BASE}/.install/functions.bash"
source "${BASE}/.install/installMain.bash"
source "${BASE}/.install/installPackages.bash"
source "${BASE}/.install/installOtherPackages.bash"
