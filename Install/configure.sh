#! /usr/bin/env bash

# ●▬▬▬▬▬๑۩  Configure bash ۩๑▬▬▬▬▬●

printInfo "Configuring zShell..."
if [[ -f ${HOME}/App/zShell/.zshrc ]]; then
rm -Rf ${HOME}/App/zShell/.zshrc
fi
copyFile ${BASE}/App/zShell/.zshrc ${HOME}/.zsrrc
printInfo "zShell configured."

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
