
" General config  "{{{
" ----------------------------------------------------------------
syntax on
colorscheme molokai

set nocompatible
set number
set foldenable
set foldmethod=marker
" ----------------------------------------------------------------"}}}

" Set up vundle  "{{{
" ----------------------------------------------------------------
filetype off " required! 
filetype plugin indent on " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle' 
" ----------------------------------------------------------------"}}}
