#!/bin/bash

yum -y install vim

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim
git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim

cd ~/.vim/bundle && \
git clone --depth=1 https://github.com/scrooloose/syntastic.git

cd ~/.vim/bundle
git clone git://github.com/godlygeek/tabular.git

git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline

cd ~/.vim/bundle
git clone git://github.com/altercation/vim-colors-solarized.git

cd ~/.vim/bundle
git clone git://github.com/tpope/vim-fugitive.git

git submodule add -f git://github.com/rodjek/vim-puppet.git ~/.vim/bundle/puppet

cd ~/.vim/bundle
git clone git://github.com/tpope/vim-sensible.git

git clone git://github.com/tmux-plugins/vim-tmux.git ~/.vim/bundle/vim-tmux

