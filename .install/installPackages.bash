#! /usr/bin/env bash

printConfirmation "Do you want to install and configure graphic packages?"
if [[ $REPLY =~ ^[Yy]$ ]]; then

    printInfo "Installing multimedia packages"
    sudo apt-get install --assume-yes --quiet \
        clementine \
        easytag \
        flac \
        id3 \
        id3v2 \
        lame \
        ripit \
        vlc

    printInfo "Installing geany"
    sudo apt-get install --assume-yes --quiet \
        geany \
        geany-plugins
    CSDIR="$HOME/.config/geany/colorschemes/"
    mkdir -p "$CSDIR"
    for SCHEME in $(ls ${BASE}/Resources/Geany/colorschemes/*.conf); do
        BNAME=$(basename "$SCHEME")
        echo " => $BNAME"
        cp "$SCHEME" "$CSDIR"
    done

    sudo apt-get install --assume-yes --quiet \
        gimp \
        gimp-data-extras \
        gimp-help-en \
        gimp-help-pt
    GIMP=$(find $HOME -iname ".gimp-*")
    if ! [[ -z "${GIMP}" ]]; then
        linkFile "${BASE}/Resources/Gimp/brushes" "${GIMP}/brushes"
        linkFile "${BASE}/Resources/Gimp/plugins" "${GIMP}/plugins"
    fi

    printInfo "Installing numix incon theme"
    sudo add-apt-repository --yes --update ppa:numix/ppa
    sudo apt-get update --quiet
    sudo apt-get install --assume-yes --quiet \
        numix-icon-theme-circle \
        numix-icon-theme-square \
        numix-gtk-theme

    printInfo "Installing ghostwriter markdown editor"
    sudo add-apt-repository --yes --update ppa:wereturtle/ppa
    sudo apt-get update --quiet
    sudo apt-get install --assume-yes --quiet \
        ghostwriter

    printInfo "Installing gpodder podcast"
    sudo add-apt-repository --yes --update ppa:thp/gpodder
    sudo apt-get update --quiet
    sudo apt-get install --assume-yes --quiet \
        gpodder

    printInfo "Installing youtube-dl"
    sudo add-apt-repository --yes --update ppa:nilarimogard/webupd8
    sudo apt-get update --quiet
    sudo apt-get install --assume-yes --quiet \
        youtube-dl
fi

printConfirmation "Do you want to install and configure Latex?"
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo apt-get install --assume-yes --quiet \
        texlive-full latexila

fi
