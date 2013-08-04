#!/bin/bash

T3=$(pidof irssi)

irssi_nickpane() {
    tmux setw main-pane-width $(( $(tput cols) - 21));
    tmux splitw -v "cat ~/.irssi/nicklistfifo";
    tmux selectl main-vertical;
    tmux selectw -t irssi;
    tmux selectp -t 0;
    tmux send-keys -t 0 "/nicklist fifo" C-m;
}

irssi_repair() {
    tmux selectw -t irssi
    (( $(tmux lsp | wc -l) > 1 )) && tmux killp -a -t 0
    irssi_nickpane
}

if [ -z "$T3" ]; then
    tmux new-session -d -s main;
    tmux killw -a -t0;
    tmux new-window -t main -n irssi irssi;
    irssi_nickpane;
fi
tmux attach-session -d -t main;
irssi_repair;
exit 0
