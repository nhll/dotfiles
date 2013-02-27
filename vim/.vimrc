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

    set shortmess+=filmnrxoOtT                  " Avoids 'hit enter' messages
    set virtualedit=onemore                     " Allow cursor beyond last character
    set history=1000                            " Default: 20

    set backup                                  " Keep backup file after overwriting
    if has('persistent_undo')
        set undofile
        set undolevels=1000                     " Number of changes that can be undone
        set undoreload=10000                    " Number of lines to save on buffer reload
    endif
" }}}

" Appearance {{{
    syntax on                                   " Syntax highlighting
    set number                                  " Enable line numbers
    set background=dark
    set t_Co=256                                " 256 colors
    colorscheme molokai
" }}}

" Key bindings / Mappings {{{
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
    Bundle 'Shougo/neocomplcache'
    let g:neocomplcache_enable_at_startup = 1   " Enable neocomplcache

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
