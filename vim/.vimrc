" General config {{{
" ----------------------------------------------------------------
syntax on
colorscheme molokai
set nocompatible
set number

" Folding
set foldenable
set foldmethod=marker
set foldlevel=99 " unfold everything on start

" Indentation and tabs
set expandtab
set tabstop=4
set shiftwidth=4 " for indentation
retab

" Searching and stuff
set ic " ignore case when searching
set hlsearch " highlighting
" ----------------------------------------------------------------}}}

" Keybindings / Mappings {{{
inoremap <c-s> <c-o>:Update<CR><CR>
" ----------------------------------------------------------------}}}

" Custom commands {{{
" ----------------------------------------------------------------
command -nargs=0 -bar Update if &modified
                           \|   if empty(bufname('%'))
                           \|       browse confirm write
                           \|   else
                           \|       confirm write
                           \|   endif
                           \|endif
" ----------------------------------------------------------------}}}

" Plugins {{{
" ----------------------------------------------------------------
" Vundle
filetype off " required! 
filetype plugin indent on " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle' 
" ----------------------------------------------------------------}}}
