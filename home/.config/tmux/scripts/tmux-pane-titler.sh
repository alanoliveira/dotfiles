#!/usr/bin/env bash

# $1 = pane_current_command
# $2 = pane_current_path
case "$1" in
  $(basename $SHELL)) echo " $(basename $2)"
  ;;
  nvim) echo " $(basename $2)"
  ;;
  *) echo $1
  ;;
esac
