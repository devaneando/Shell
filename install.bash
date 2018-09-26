#!/bin/bash

reset

export BASE
BASE=$(env readlink --canonicalize-missing $0 | env grep --color=never -P "^.*(?=\/install)" -o)

source "${BASE}/.install/functions.bash"
source "${BASE}/.install/packages.bash"
source "${BASE}/.install/configure.bash"
source "${BASE}/.install/composer.bash"
