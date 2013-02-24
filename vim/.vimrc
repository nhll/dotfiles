" General config {{{
" ----------------------------------------------------------------
set nocompatible " vim mode

syntax on
colorscheme molokai
set number

" Folding
set foldenable
set foldmethod=marker
" set foldlevel=99 " unfold everything on start

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
" ----------------------------------------------------------------
let mapleader = ","

" Treat long, wrapped lines as break lines
map j gj
map k gk

" Save files with Ctrl+S no matter in which mode it's pressed
noremap <silent> <C-S>      :Update<CR>
vnoremap <silent> <C-S>     <C-C>:Update<CR>
inoremap <silent> <C-S>     <C-O>:Update<CR>
" ----------------------------------------------------------------}}}

" Plugins {{{
" ----------------------------------------------------------------
filetype off                        " required by vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

" Github Bundles
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"
Bundle 'garbas/vim-snipmate'
Bundle 'ervandew/supertab'

" Other Git Bundles
Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on           " required by vundle
" ----------------------------------------------------------------}}}
"
" Custom commands {{{
" ----------------------------------------------------------------
" File saving
command -nargs=0 -bar Update if &modified
                           \|   if empty(bufname('%'))
                           \|       browse confirm write
                           \|   else
                           \|       confirm write
                           \|   endif
                           \|endif
" ----------------------------------------------------------------}}}
