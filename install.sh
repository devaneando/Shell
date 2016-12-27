# !/usr/bin/env bash
# vi:syntax=bash

export BASE=`env readlink --canonicalize-missing $0 | env grep --color=never -P "^.*(?=\/install)" -o`

function printInfo(){
	env echo -e "\e[1;32m\e[3m${1}\e[0m"
}

function printError(){
	env echo -e "\e[0;31m\e[3m${1}\e[0m"
	exit 1
}

# ●▬▬▬▬▬๑۩  Required packages ۩๑▬▬▬▬▬●

printInfo("Install required packages...")
sudo apt-get install --assume-yes vim cmake php-pear php7-cli python-dev build-essential php-codesniffer

# ●▬▬▬▬▬๑۩  Bash ۩๑▬▬▬▬▬●

rm --force ${HOME}/.bash_profile
rm --force ${HOME}/.bashPrivate
rm --force ${HOME}/.bashrc
rm --force ${HOME}/.profile
cp ${BASE}/Apps/Bash/bashPrivate.bash ${HOME}/.bashPrivate
ln --force --symbolic ${BASE}/Apps/Bash/bashrc.bash ${HOME}/.bash_profile
ln --force --symbolic ${BASE}/Apps/Bash/bashrc.bash ${HOME}/.bashrc
ln --force --symbolic ${BASE}/Apps/Bash/bashrc.bash ${HOME}/.profile

# ●▬▬▬▬▬๑۩  Other ۩๑▬▬▬▬▬●

rm --force --recursive ${HOME}/.fonts
rm --force ${HOME}/.wgetrc
ln --force --symbolic ${BASE}/Apps/Wget/wgetrc.ini ${HOME}/.wgetrc
ln --force --symbolic ${BASE}/Resources/Fonts/ ${HOME}/.fonts

# ●▬▬▬▬▬๑۩  Git ۩๑▬▬▬▬▬●

rm --force ${HOME}/.gitconfig
rm --force ${HOME}/.gitignore
ln --force --symbolic ${BASE}/Apps/Git/gitconfig.ini ${HOME}/.gitconfig
ln --force --symbolic ${BASE}/Apps/Git/gitignore.conf ${HOME}/.gitignore

# ●▬▬▬▬▬๑۩  Vim ۩๑▬▬▬▬▬●

rm --force ${HOME}/.vimrc
rm --force ${HOME}/.vim
ln --force --symbolic ${BASE}/Apps/Vim/ ${HOME}/.vim
ln --force --symbolic ${BASE}/Apps/Vim/vimrc.vim ${HOME}/.vimrc
vim +PluginInstall +qall
sudo chown -R `whoami`:`whoami` ${BASE}/Apps/Vim/bundle/
# Compile Vimproc
cd ${BASE}/Apps/Vim/bundle/vimproc.vim/
make
# Compile YouCompleteMe
cd ${BASE}/Apps/Vim/bundle/YouCompleteMe/
install.py --clang-completer
cd ${HOME}
vim +PluginInstall +qall

# ●▬▬▬▬▬๑۩  Phar files ۩๑▬▬▬▬▬●

printInfo("Installing Composer..")
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php composer-setup.php --install-dir=/usr/local/bin/ --filename=composer
php -r "unlink('composer-setup.php');"

printInfo("Installing PHP-CS-Fixer...")
curl -L https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases/download/v2.0.0/php-cs-fixer.phar -o php-cs-fixer
sudo chmod a+x php-cs-fixer
sudo mv php-cs-fixer /usr/local/bin/php-cs-fixer
sudo php-cs-fixer self-update

# ●▬▬▬▬▬๑۩  Geany ۩๑▬▬▬▬▬●

printInfo("Linking Geany addons...")
${BASE}/Apps/Geany/geany-themes/install.sh


