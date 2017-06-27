#!/bin/bash

TERMITE_DIR="/home/nik/.config/termite"

THEME_FILE="$TERMITE_DIR/themes/$1.config"
CONFIG_DIR="$TERMITE_DIR/configs"

if [ -f $THEME_FILE ]; then
  echo "[Termite] Switching to $1 theme..."
  cat $THEME_FILE $CONFIG_DIR/*.config > $TERMITE_DIR/config
  killall -s USR1 termite &> /dev/null
  exit 0
else
  echo "[Termite] File $THEME_FILE does not exist."
  exit 1
fi
