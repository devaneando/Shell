#! /usr/bin/env zsh

reset

export BASE
BASE=$(env readlink --canonicalize-missing $0 | env grep --color=never -P "^.*(?=\/install)" -o)

source Install/functions.sh
source Install/nonGraphicalPackages.sh
source Install/composer.sh
source Install/graphicalPackages.sh
