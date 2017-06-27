#!/bin/bash

I3_DIR="/home/nik/.i3"

THEME_FILE="$I3_DIR/themes/$1.config"
CONFIG_DIR="$I3_DIR/configs"

if [ -f $THEME_FILE ]; then
  echo "Switching to $1 theme..."
  cat $THEME_FILE $CONFIG_DIR/*.config > $I3_DIR/config
  i3-msg restart &> /dev/null
  exit 0
else
  echo "File $THEME_FILE does not exist."
  exit 1
fi
