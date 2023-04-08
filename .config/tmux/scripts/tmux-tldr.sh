#!/usr/bin/env bash

read -p "Enter Subject: " subject
if [ -z $subject ]; then
  exit 0
fi

tmux new-window bash -c "tldr --color always $subject | less -r"
