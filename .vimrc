"The vim config are just a bunch of commands to vim"
"The set command has universal short hands for variables"
"Help [option] will show you help for it"

"Type q: to open a split buffer of your vim command history"
"Hit <Enter> on a command to execute it"
"You can also type a partial command and then use <Up>/<Down>"
set nocompatible

"Set relative number and number column"
set number "nu"
set relativenumber "rnu"
set nuw=8



set et ts=4 sts=4 sw=4
set si cin

syntax on
filetype indent plugin on
set bg=dark
colorscheme slate
hi MatchParen None

set ic sc is

set path=.,**
set clipboard=unnamed

set makeprg=g++\ -std=c++20\ %\ -o\ a.out\ 2>\ e

let mapleader = " "
nnoremap <leader>c :w<CR>:silent !g++ -std=c++20 % 2> e<CR>:cf e<CR>:cl<CR>:redraw!<CR>
nnoremap <leader>m :w<CR>:make<CR>:cf e<CR>:cl<CR>
nnoremap <leader>f :w<CR>:%!clang-format<CR>
