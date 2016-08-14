set tabstop=2
syntax on
set encoding=utf-8
set nocompatible
set t_Co=256
set ignorecase
set noerrorbells
set mouse=a
set nowrap
set scrolloff=3
filetype plugin indent on
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#branch#use_vcscommand = 0
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tabline#enabled = 1
execute pathogen#infect()
set background=dark
colorscheme solarized
" let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1
