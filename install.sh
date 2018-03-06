#! /usr/bin/env bash

reset

export BASE
BASE=$(env readlink --canonicalize-missing $0 | env grep --color=never -P "^.*(?=\/install)" -o)
echo "export BASE=\"${BASE}\"" > "${HOME}/.zsh_base"

source ${BASE}/Install/functions.sh
source ${BASE}/Install/nonGraphicalPackages.sh
source ${BASE}/Install/composer.sh
source ${BASE}/Install/graphicalPackages.sh
source ${BASE}/Install/configure.sh
