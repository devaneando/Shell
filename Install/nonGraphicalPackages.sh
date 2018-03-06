#! /usr/bin/env bash

# ●▬▬▬▬▬๑۩  Required packages ۩๑▬▬▬▬▬●

printInfo "Installing required packages..."
sudo apt-get update --quiet

sudo apt-get install --assume-yes --quiet \
    aspell \
    aspell-en \
    aspell-pt \
    aspell-pt-br \
    aspell-pt-pt \
    hyphen-en-us \
    hyphen-pt-br \
    hyphen-pt-pt \
    myspell-pt \
    myspell-pt-br \
    myspell-pt-pt \
    zsh

sudo apt-get install --assume-yes --quiet \
    php-bz2 \
    php-cli \
    php-codesniffer \
    php-common \
    php-curl \
    php-gd \
    php-intl \
    php-json \
    php-mbstring \
    php-mcrypt \
    php-mysql \
    php-pear \
    php-readline \
    php-soap \
    php-xml \
    php-xsl \
    php-zip

sudo apt-get install --assume-yes --quiet \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python-dev \
    python-pip \
    python-setuptools

sudo apt-get install --assume-yes --quiet \
    bzip2 \
    cifs-utils \
    cmake \
    ctags \
    curl \
    gcc \
    git \
    mariadb-client \
    nfs-kernel-server \
    p7zip-full \
    ssh \
    unrar \
    unzip \
    vim \
    zip

sudo apt-get install --assume-yes --quiet \
    fortunes \
    fortunes-off \
    googler \
    id3 \
    id3v2 \
    lame \
    sysvbanner \
    toilet

apt-get autoremove --assume-yes --quiet

printInfo "shfmt: Installing Shell formatter..."

if ! [[ -e "/usr/bin/shfmt" ]]; then
    curl -L https://github.com/mvdan/sh/releases/download/v2.2.1/shfmt_v2.2.1_linux_amd64 --output shfmt
    chmod 755 shfmt
    sudo mv --force --verbose shfmt /usr/bin/
fi

printInfo "ddgr: DuckDuckGo from the terminal..."

if ! [[ -e "/usr/bin/ddgr" ]]; then
    sudo add-apt-repository ppa:twodopeshaggy/jarun
    sudo apt-get update --quiet && apt-get install --assume-yes --quiet ddgr
fi
