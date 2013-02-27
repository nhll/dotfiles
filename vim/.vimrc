" General {{{
    set nocompatible                            " Vim mode

    " Initialize vundle for Bundle support {{{
        filetype off                            " Required 
        filetype plugin indent on               " Required 
        set rtp+=~/.vim/bundle/vundle
        call vundle#rc()
        Bundle 'gmarik/vundle'
    " }}}

    set shortmess+=filmnrxoOtT                  " Avoids 'hit enter' messages
    set virtualedit=onemore                     " Allow cursor beyond last character
    set history=1000                            " Default: 20

    set directory=~/tmp/vim-swap,~/tmp,/tmp     " Directories for swap files

    set backup
    set backupdir=~/tmp/vim-backup              " Directory for backup files
    if has('persistent_undo')
        set undofile
        set undodir^=~/tmp/vim-undo,~/tmp,/tmp  " Directories for undo files
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

    set showmode                                " Display the current mode
    set cursorline                              " Highlight the current line

    if has('cmdline_info')
        set ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " From spf13
        set showcmd                             " Show partial commands on status line
    endif

    if has('statusline')
        set laststatus=2

        set statusline=%<%f\                        " Filename
        set statusline+=%w%h%m%r                    " Options
        set statusline+=%{fugitive#statusline()}    " Git Hotness
        set statusline+=\ [%{&ff}/%Y]               " Filetype
        set statusline+=\ [%{getcwd()}]             " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%     " Right aligned file nav info
    endif

    set backspace=indent,eol,start                  " Backspace for dummies (spf13)
    set linespace=0                                 " No extra spaces between rows

    set incsearch                                   " Find while typing
    set hlsearch                                    " Highlight search results
    set ignorecase                                  " Case insensitive searching
    set smartcase                                   " Case sensitive when uc present
    set wildmenu                                    " Show list instead of just completing
    set wildmode=list:longest,full                  " See spf13
    set whichwrap=b,s,h,l,<,>,[,]                   " Backspaces and cursor keys wrap too
    set scrolljump=10                               " Lines to scroll when cursor leaves screen
    set scrolloff=5                                 " Min. lines to keep above and below cursor
    set foldenable                                  " Enable folding
    set foldmethod=marker                           " Fold at triple parans

    set list
    set listchars=tab:,.,trail:.,extends:#,nbsp:.   " Highlight problematic whitespaces
" }}}

" Formatting {{{
    " set nowrap                                  " Wrap long lines
    set autoindent                              " Indent at the same level as previous line
    set expandtab                               " Tabs = spaces
    set shiftwidth=4                            " Indent 4 spaces
    set tabstop=4                               " Indentation every 4 columns
    set softtabstop=4                           " Backspace deletes indent

    " Remove trailing whitespaces
    autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> call StripTrailingWhitespace()
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
    " Github Bundles
    Bundle "tomtom/tlib_vim"
    Bundle "honza/snipmate-snippets"
    Bundle "MarcWeber/vim-addon-mw-utils"
    Bundle 'garbas/vim-snipmate'
    Bundle 'tpope/vim-fugitive'
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
