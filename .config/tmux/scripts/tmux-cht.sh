#!/usr/bin/env bash

read -p "Enter Subject: " subject
if [ -z $subject ]; then
  exit 0
fi

read -p "Enter Query: " query
query=`echo $query | sed "s#^\([a-zA-Z_0-9]\)#/\1#" | tr ' ' '+'`

tmux new-window bash -c "curl -s cht.sh/$subject$query | less -r"
