#!/bin/bash
# download dot files
echo -e "\033[34mDownloading dot files\033[0m"
curl https://raw.githubusercontent.com/tsj/dot_files/master/.bashrc -o ~/.bashrc
curl https://raw.githubusercontent.com/tsj/dot_files/master/.bash_profile -o ~/.bash_profile
curl https://raw.githubusercontent.com/tsj/dot_files/master/.vimrc -o ~/.vimrc
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash

# download Vundle.vim
rm -rf ~/.vim/bundle/
echo -e "\033[34mDownloading Vundle.vim\033[0m"
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Installing vim plugins
echo -e "\033[34mInstalling vundle plugin\033[0m"
vim +PluginInstall +qall
echo -e "\033[34mInstalling go binaries\033[0m"
vim +GoInstallBinaries +qall
echo -e "\033[32mDone\033[0m"

source ~/.bash_profile
