#! /usr/bin/env bash

# ●▬▬▬▬▬๑۩  Required packages ۩๑▬▬▬▬▬●

printInfo "Installing required packages..."
sudo apt-get update --quiet

sudo apt-get install --assume-yes --quiet \
     aspell aspell-en aspell-pt aspell-pt-br aspell-pt-pt hyphen-en-us hyphen-pt-br hyphen-pt-pt myspell-pt \
     myspell-pt-br myspell-pt-pt

sudo apt-get install --assume-yes --quiet \
     php-bz2 php-cli php-codesniffer php-common php-curl php-gd php-intl php-json php-mbstring php-mcrypt php-mysql \
     php-pear php-readline php-soap php-xml php-xsl php-zip

sudo apt-get install --assume-yes --quiet \
     python3-dev python3-pip python3-setuptools python-dev python-pip python-setuptools

sudo apt-get install --assume-yes --quiet \
     bzip2 cifs-utils cmake ctags curl gcc git mariadb-client nfs-kernel-server p7zip-full ssh unrar unzip vim zip

sudo apt-get install --assume-yes --quiet \
     cowsay cowsay-off fortunes fortunes-off id3 id3v2 lame

printInfo "Required packages installed."

if ! [[ -e "/usr/local/bin/composer" ]]
then
    printInfo "Installing Composer.."
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    sudo php composer-setup.php --install-dir=/usr/local/bin/ --filename=composer
    php -r "unlink('composer-setup.php');"
    printInfo "Composer installed."
fi

if ! [[ -e "/usr/local/bin/php-cs-fixer" ]]
then
    printInfo "Installing PHP-CS-Fixer..."
    curl -L https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases/download/v2.0.0/php-cs-fixer.phar -o php-cs-fixer
    sudo chmod a+x php-cs-fixer
    sudo mv php-cs-fixer /usr/local/bin/php-cs-fixer
    sudo php-cs-fixer self-update
    printInfo "PHP-CS-Fixer installed."
fi

# ●▬▬▬▬▬๑۩  Configure bash ۩๑▬▬▬▬▬●

printInfo "Configuring Bash..."
linkFile ${BASE}/Apps/Bash/bashrc.bash ${HOME}/.bashrc
linkFile ${BASE}/Apps/Bash/bashrc.bash ${HOME}/.bash_profile
linkFile ${BASE}/Apps/Bash/bashrc.bash ${HOME}/.profile
copyFile ${BASE}/Apps/Bash/bashPrivate.bash ${HOME}/.bashPrivate
printInfo "Bash configured."

# ●▬▬▬▬▬๑۩  Fonts ۩๑▬▬▬▬▬●

printInfo "Configuring fonts..."
linkFile ${BASE}/Resources/Fonts ${HOME}/.fonts
printInfo "Fonts configured."

# ●▬▬▬▬▬๑۩  Vim ۩๑▬▬▬▬▬●

printInfo "Configuring Vim..."
linkFile ${BASE}/Apps/Vim  ${HOME}/.vim
linkFile ${BASE}/Apps/Vim/vimrc.vim  ${HOME}/.vimrc
linkFile ${BASE}/Apps/Vim/gvimrc.vim  ${HOME}/.gvimrc
gvimrc.vim ${HOME}/.gvimrc
vim +PluginInstall +qall
sudo chown -R `whoami`:`whoami` ${BASE}/Apps/Vim/bundle/
# Compile Vimproc
cd ${BASE}/Apps/Vim/bundle/vimproc.vim/
make
cd ${HOME}
vim +PluginInstall +qall
printInfo "Vim configured."

# ●▬▬▬▬▬๑۩  Git ۩๑▬▬▬▬▬●

printInfo "Configuring Git..."
linkFile ${BASE}/Apps/Git/gitignore.conf  ${HOME}/.gitignore
copyFile ${BASE}/Apps/Git/gitconfig.ini  ${HOME}/.gitconfig
printInfo "Git configured."

# ●▬▬▬▬▬๑۩  Other settings ۩๑▬▬▬▬▬●

printInfo "Configuring Wget..."
linkFile ${BASE}/Apps/Wget/wgetrc.ini ${HOME}/.wgetrc
printInfo "Wget configured ..."

if [ -e "/usr/share/gtksourceview-2.0/language-specs" ]; then
    printInfo "Copying GtkSourceView language spec files..."
    find Shell/Resources/GtkSourceView/language-specs/ -iname "*.lang" -exec sudo \cp -rfv {} /usr/share/gtksourceview-2.0/language-specs \;
    printInfo "GtkSourceView language spec files copied."
fi

if [ -e "/usr/share/gtksourceview-3.0/language-specs" ]; then
    printInfo "Copying GtkSourceView language spec files..."
    find Shell/Resources/GtkSourceView/language-specs/ -iname "*.lang" -exec sudo \cp -rfv {} /usr/share/gtksourceview-3.0/language-specs \;
    printInfo "GtkSourceView language spec files copied."
fi

