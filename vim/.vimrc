
" General config  
" ----------------------------------------------------------------
syntax on
colorscheme wombat

set nocompatible
set number
set foldmethod=manual
" ----------------------------------------------------------------

" Set up vundle  
" ----------------------------------------------------------------
filetype off " required! 
filetype plugin indent on " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle' 
" ----------------------------------------------------------------
