#!/bin/bash

# ●▬▬▬▬▬๑۩  Basic packages ۩๑▬▬▬▬▬●

sudo apt-get update --quiet &> /dev/null
sudo apt-get install --assume-yes --quiet \
    aspell \
    aspell-en \
    aspell-pt \
    aspell-pt-br \
    aspell-pt-pt \
    bzip2 \
    cifs-utils \
    cmake \
    ctags \
    curl \
    fortunes \
    fortunes-off \
    gcc \
    git \
    gprename \
    googler \
    hyphen-en-us \
    hyphen-pt-br \
    hyphen-pt-pt \
    id3 \
    id3v2 \
    lame \
    mariadb-client \
    myspell-pt \
    myspell-pt-br \
    myspell-pt-pt \
    nfs-kernel-server \
    p7zip-full \
    python-dev \
    python-pip \
    python-setuptools \
    python3-dev \
    python3-pip \
    python3-setuptools \
    ssh \
    sysvbanner \
    toilet \
    unrar \
    unzip \
    vim \
    zip

# ●▬▬▬▬▬๑۩  Development packages ۩๑▬▬▬▬▬●

sudo apt-get install --assume-yes --quiet \
    apache2 \
    libapache2-mod-php7.2 \
    mariadb-server \
    php7.2-bz2 \
    php7.2-cli \
    php7.2-curl \
    php7.2-curl \
    php7.2-gd \
    php7.2-intl \
    php7.2-json \
    php7.2-mbstring \
    php7.2-mysql \
    php7.2-xml \
    php7.2-xsl \
    php7.2-zip

# ●▬▬▬▬▬๑۩  Graphical packages ۩๑▬▬▬▬▬●

sudo apt-get autoremove --assume-yes --quiet
printConfirmation "Do you want to install graphical packages?"
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo add-apt-repository --yes ppa:nilarimogard/webupd8
    sudo add-apt-repository --yes ppa:numix/ppa
    sudo add-apt-repository --yes ppa:ondrej/php
    sudo add-apt-repository --yes ppa:thp/gpodder
    sudo add-apt-repository --yes ppa:twodopeshaggy/jarun
    sudo add-apt-repository --yes ppa:wereturtle/ppa
    sudo apt-get update --quiet &> /dev/null

    sudo apt-get install --assume-yes --quiet \
        clementine \
        ddgr \
        easytag \
        exfalso \
        flac \
        geany \
        geany-plugins \
        ghostwriter \
        gpodder \
        id3 \
        id3v2 \
        lame \
        numix-gtk-theme \
        numix-icon-theme-circle \
        numix-icon-theme-square \
        ripit \
        tilda \
        vlc \
        youtube-dl
fi

# ●▬▬▬▬▬๑۩  Latex packages ۩๑▬▬▬▬▬●

sudo apt-get autoremove --assume-yes --quiet
printConfirmation "Do you want to install and configure Latex?"
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo apt-get install --assume-yes --quiet \
        texlive-full latexila texstudio texmaker
fi
