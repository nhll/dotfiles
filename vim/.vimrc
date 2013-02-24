" General config {{{
" ----------------------------------------------------------------
syntax on
colorscheme molokai
set nocompatible
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
" Save files with Ctrl+S no matter in which mode it's pressed
noremap <silent> <C-S>      :Update<CR>
vnoremap <silent> <C-S>     <C-C>:Update<CR>
inoremap <silent> <C-S>     <C-O>:Update<CR>
" ----------------------------------------------------------------}}}

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

" Plugins {{{
" ----------------------------------------------------------------

" ----------------------------------------------------------------}}}
