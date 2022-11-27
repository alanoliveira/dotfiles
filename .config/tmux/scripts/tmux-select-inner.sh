#!/usr/bin/env bash

case $1 in
   w) tmux send -X select-word ;;
esac
