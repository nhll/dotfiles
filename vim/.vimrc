"""""" General vim config

set nocompatible
syntax on
colorscheme wombat


"""""" Set up vundle

filetype off " required by vundle
filetype plugin indent on " required by vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle' 
