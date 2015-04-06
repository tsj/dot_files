# download dot files
curl https://raw.githubusercontent.com/tsj/dot_files/master/.bashrc -o ~/.bashrc
curl https://raw.githubusercontent.com/tsj/dot_files/master/.bash_profile -o ~/.bash_profile
curl https://raw.githubusercontent.com/tsj/dot_files/master/.vimrc -o ~/.vimrc

# setup bash
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
cp -v .bash_profile ~/.bash_profile
cp -v .bashrc ~/.bashrc

# setup vim
rm -rf ~/.vim/bundle/
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp -v .vimrc ~/.vimrc
echo "Install vundle plugin"
echo "$ vim +PluginInstall +qall"
echo "Install go binaries"
echo "$ vim +GoInstallBinaries +qall"
echo "Done"
