" General {{{
    set nocompatible                            " Vim mode
    set foldenable                              " Enable folding
    set foldmethod=marker                       " Fold at triple parans
    set expandtab
    set tabstop=4
    set shiftwidth=4                            " Indent 4 spaces
    retab                                       " Replace tabs with spaces
    set ic                                      " Ignore case when searching
    set hlsearch                                " Highlight search results
" }}}

" Appearance {{{
    syntax on                                   " Syntax highlighting
    set number                                  " Enable line numbers
    colorscheme molokai
" }}}

" Keybindings / Mappings {{{
    let mapleader = ","
    
    map j gj
    map k gk

    " Save files with Ctrl+S no matter in which mode it's pressed
    noremap <silent> <C-S>      :Update<CR>
    vnoremap <silent> <C-S>     <C-C>:Update<CR>
    inoremap <silent> <C-S>     <C-O>:Update<CR>
" }}}

" Bundles {{{
    " Initialize vundle
    filetype off                                " Required 
    filetype plugin indent on                   " Required 
    set rtp+=~/.vim/bundle/vundle
    call vundle#rc()
    Bundle 'gmarik/vundle'

    " Github Bundles
    Bundle "tomtom/tlib_vim"
    Bundle "honza/snipmate-snippets"
    Bundle "MarcWeber/vim-addon-mw-utils"
    Bundle 'garbas/vim-snipmate'

    " Other Git Bundles
    Bundle 'git://git.wincent.com/command-t.git'
" }}}

" Custom commands {{{
    " For saving with Ctrl+S
    command -nargs=0 -bar Update if &modified
                               \|   if empty(bufname('%'))
                               \|       browse confirm write
                               \|   else
                               \|       confirm write
                               \|   endif
                               \|endif
" }}}
