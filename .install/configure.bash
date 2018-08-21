#! /usr/bin/env bash


# ●▬▬▬▬▬๑۩  Tilda ۩๑▬▬▬▬▬●

printInfo "Configuring tilda..."
if [[ -d ${HOME}/.config/tilda ]]; then
rm -Rfv ${HOME}/.config/tilda
fi
linkFile ${BASE}/App/Tilda ${HOME}/.config/tilda
printInfo "tilda configured."

# ●▬▬▬▬▬๑۩  Fonts ۩๑▬▬▬▬▬●

printInfo "Configuring fonts..."
linkFile ${BASE}/Resources/Fonts ${HOME}/.fonts
printInfo "Fonts configured."

# ●▬▬▬▬▬๑۩  Vim ۩๑▬▬▬▬▬●

printInfo "Configuring Vim..."
linkFile ${BASE}/App/Vim ${HOME}/.vim
linkFile ${BASE}/App/Vim/vimrc.vim ${HOME}/.vimrc
linkFile ${BASE}/App/Vim/gvimrc.vim ${HOME}/.gvimrc
gvimrc.vim ${HOME}/.gvimrc
vim +PluginInstall +qall
sudo chown -R $(whoami):$(whoami) ${BASE}/App/Vim/bundle/
# Compile Vimproc
cd ${BASE}/App/Vim/bundle/vimproc.vim/
make
cd ${HOME}
vim +PluginInstall +qall
printInfo "Vim configured."

# ●▬▬▬▬▬๑۩  Git ۩๑▬▬▬▬▬●

printInfo "Configuring Git..."
linkFile ${BASE}/App/Git/gitignore.conf ${HOME}/.gitignore
copyFile ${BASE}/App/Git/gitconfig.ini ${HOME}/.gitconfig
printInfo "Git configured."

# ●▬▬▬▬▬๑۩  Geany ۩๑▬▬▬▬▬●
rm -Rf ~/.config/geany
ln -s ~/Shell/App/Geany/ ~/.config/geany

# ●▬▬▬▬▬๑۩  Bash ۩๑▬▬▬▬▬●
rm -Rf ~/.bashrc
cp ~/Shell/App/Bash/bashrc.bash ~/.bashrc
