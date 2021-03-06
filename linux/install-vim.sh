#!/bin/bash

echo "install vim git tmux"
yum -y install vim git tmux

echo "create directorys"
mkdir -p ~/.vim/autoload ~/.vim/bundle

echo "install pathogen"
curl -LSso ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

#echo "install ctrlp"
#cd ~/.vim/bundle
#git clone https://github.com/kien/ctrlp.vim.git ctrlp.vim

echo "install Nerdtree"
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git nerdtree

echo "install syntastic"
cd ~/.vim/bundle
git clone https://github.com/scrooloose/syntastic.git syntastic

echo "install tabular"
cd ~/.vim/bundle
git clone https://github.com/godlygeek/tabular.git tabular

echo "install airline"
cd ~/.vim/bundle
git clone https://github.com/vim-airline/vim-airline vim-airline

echo "install airline themes"
cd ~/.vim/bundle
git clone https://github.com/vim-airline/vim-airline-themes vim-airline-themes

echo "install tlib_vim"
cd ~/.vim/bundle
git clone https://github.com/tomtom/tlib_vim.git tlib_vim

echo "install vim-addon-mw-utils"
cd ~/.vim/bundle
git clone https://github.com/MarcWeber/vim-addon-mw-utils vim_addon-mw-utils

echo "install vim-snipmate"
cd ~/.vim/bundle
git clone https://github.com/garbas/vim-snipmate vim-snipmate

echo "install vim-snippets"
cd ~/.vim/bundle
git clone https://github.com/honza/vim-snippets vim-snippets

echo "install powerline fonts"
cd ~
git clone https://github.com/powerline/fonts powerlinefonts
cd powerlinefonts
bash ./install.sh

echo "install vim-colors-solarized"
cd ~/.vim/bundle
git clone https://github.com/altercation/vim-colors-solarized.git vim-colors-solarized

echo "install vim-fugitive"
cd ~/.vim/bundle
git clone https://github.com/tpope/vim-fugitive.git vim-fugitive

echo "install vim puppet"
cd ~/.vim/bundle
git clone https://github.com/rodjek/vim-puppet.git puppet

echo "install vim-sensible"
cd ~/.vim/bundle
git clone https://github.com/tpope/vim-sensible.git vim-sensible

echo "install vim-tmux"
cd ~/.vim/bundle
git clone https://github.com/tmux-plugins/vim-tmux.git vim-tmux

echo "download vimrc"
curl -LSso ~/.vimrc https://raw.githubusercontent.com/sturbi/environment/master/linux/.vimrc

echo "download tmux.conf"
curl -LSso ~/.tmux.conf https://raw.githubusercontent.com/sturbi/environment/master/linux/.tmux.conf


