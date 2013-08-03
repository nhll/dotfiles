# General {{{
    # Enable vi-mode
    bindkey -v
# }}}

# Aliases {{{
    # allows ctrl-s (etc.) mappings in vim
    alias vim="stty stop '' -ixoff ; vim"
    ttyctl -f

    # colorful ls
    alias ls="ls --color"

    alias rmrf="rm -rfv"
    alias irssi="sh ~/.dotfiles/irssi/irssi_nicklist.sh"
# }}}

# Stuff from holman's dotfiles {{{
    # shortcut to this dotfiles path is $ZSH
    export ZSH=$HOME/.dotfiles

    # your project folder that we can `c [tab]` to
    export PROJECTS=~/code

    # source every .zsh file in this rep
    for config_file ($ZSH/**/*.zsh) source $config_file

    # use .localrc for SUPER SECRET CRAP that you don't
    # want in your public, versioned repo.
    if [[ -a ~/.localrc ]]
    then
      source ~/.localrc
    fi

    # initialize autocomplete here, otherwise functions won't be loaded
    autoload -U compinit
    compinit

    # load every completion after autocomplete loads
    for config_file ($ZSH/**/completion.zsh) source $config_file

    vi-append-x-selection () { RBUFFER=$(xsel -o -p </dev/null)$RBUFFER; }
    zle -N vi-append-x-selection
    bindkey -a '^V' vi-append-x-selection
    vi-yank-x-selection () { print -rn -- $CUTBUFFER | xsel -i -p; }
    zle -N vi-yank-x-selection
    bindkey -a '^C' vi-yank-x-selection
# }}}

# Lines configured by zsh-newuser-install {{{
    HISTFILE=~/.tmp/.zsh-history
    HISTSIZE=250000
    SAVEHIST=250000
    setopt nomatch
    unsetopt appendhistory autocd beep extendedglob notify
    bindkey -v
# }}}

# Lines added by compinstall {{{
    zstyle :compinstall filename '/home/nik/.zshrc'

    autoload -Uz compinit
    compinit
# }}} of lines added by compinstall
