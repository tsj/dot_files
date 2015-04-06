# setup bash
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
cp -v .bash_profile ~/.bash_profile
cp -v .bashrc ~/.bashrc

# setup vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp -v .vimrc ~/.vimrc
vim +PluginInstall +qall
vim +GoInstallBinaries +qall
