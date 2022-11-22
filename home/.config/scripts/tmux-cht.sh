#!/usr/bin/env bash

complex=("rust" "golang" "ruby" "php" "nodejs" "tmux" "zsh" "lua" "bash" "css" "html")

read -p "Enter Subject: " subject
if [ -z $subject ]; then
  exit 0
fi

read -p "Enter Query: " query
query=`echo $query | tr ' ' '+'`

if [[ " ${complex[*]} " =~ " ${subject} " ]]; then
  tmux new-window bash -c "echo \"curl -s cht.sh/$subject/$query/\" & curl -s cht.sh/$subject/$query | less -r"
else
  tmux new-window bash -c "curl -s cht.sh/$subject~$query | less -r"
fi
