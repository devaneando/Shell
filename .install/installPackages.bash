#! /usr/bin/env bash

printConfirmation "Do you want to install and configure Geany?"
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt-get install --assume-yes --quiet \
         geany geany-plugins
    CSDIR="$HOME/.config/geany/colorschemes/"
    mkdir -p "$CSDIR"
    for SCHEME in `ls ${BASE}/Apps/Geany/geany-themes/colorschemes/*.conf`
    do
      BNAME=`basename "$SCHEME"`
      echo " => $BNAME"
      cp "$SCHEME" "$CSDIR"
    done
fi

printConfirmation "Do you want to install and configure Gimp?"
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt-get install --assume-yes --quiet \
         gimp gimp-data-extras gimp-help-en gimp-help-pt
    GIMP=`find $HOME -iname ".gimp-*"`
    if ! [[ -z "${GIMP}" ]]
    then
        linkFile "${BASE}/Resources/Gimp/brushes" "${GIMP}/brushes"
        linkFile "${BASE}/Resources/Gimp/plugins" "${GIMP}/plugins"
    fi
fi
