#!/bin/bash

echo "******************************************************************"
echo "install vim git tmux"
yum -y install vim git tmux
echo "******************************************************************"

echo "******************************************************************"
echo "create directorys"
mkdir -p ~/.vim/autoload ~/.vim/bundle
echo "******************************************************************"

echo "******************************************************************"
echo "install pathogen"
curl -LSso ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
echo "******************************************************************"

echo "******************************************************************"
echo "install ctrlp"
cd ~/.vim/bundle
git clone https://github.com/kien/ctrlp.vim.git ctrlp.vim
echo "******************************************************************"

echo "******************************************************************"
echo "install syntastic"
cd ~/.vim/bundle
git clone https://github.com/scrooloose/syntastic.git syntastic
echo "******************************************************************"

echo "******************************************************************"
echo "install tabular"
cd ~/.vim/bundle
git clone https://github.com/godlygeek/tabular.git tabular
echo "******************************************************************"

echo "******************************************************************"
echo "install airline"
cd ~/.vim/bundle
git clone https://github.com/vim-airline/vim-airline vim-airline
echo "******************************************************************"

echo "******************************************************************"
echo "install airline themes"
cd ~/.vim/bundle
git clone https://github.com/vim-airline/vim-airline-themes vim-airline-themes
echo "******************************************************************"

echo "******************************************************************"
echo "install powerline fonts"
cd ~
git clone https://github.com/powerline/fonts powerlinefonts
cd powerlinefonts
bash ./install.sh
echo "******************************************************************"

echo "******************************************************************"
echo "install vim-colors-solarized"
cd ~/.vim/bundle
git clone https://github.com/altercation/vim-colors-solarized.git vim-colors-solarized
echo "******************************************************************"

echo "******************************************************************"
echo "install vim-fugitive"
cd ~/.vim/bundle
git clone https://github.com/tpope/vim-fugitive.git vim-fugitive
echo "******************************************************************"

echo "******************************************************************"
echo "install vim puppet"
cd ~/.vim/bundle
git clone https://github.com/rodjek/vim-puppet.git puppet
echo "******************************************************************"

echo "******************************************************************"
echo "install vim-sensible"
cd ~/.vim/bundle
git clone https://github.com/tpope/vim-sensible.git vim-sensible
echo "******************************************************************"

echo "******************************************************************"
echo "install vim-tmux"
cd ~/.vim/bundle
git clone https://github.com/tmux-plugins/vim-tmux.git vim-tmux
echo "******************************************************************"

echo "******************************************************************"
echo "download vimrc"
curl -LSso ~/.vimrc https://raw.githubusercontent.com/sturbi/environment/master/linux/.vimrc
echo "******************************************************************"

echo "******************************************************************"
echo "download tmux.conf"
curl -LSso ~/.tmux.conf https://raw.githubusercontent.com/sturbi/environment/master/linux/.tmux.conf
echo "******************************************************************"


