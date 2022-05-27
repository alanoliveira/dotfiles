SHELL := /bin/sh
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
HOME:=${HOME}

nvim:
	@ln -nsf $(ROOT_DIR)/nvim ~/.config/nvim

tmux:
	@ln -fs "$(ROOT_DIR)/tmux/.tmux/.tmux.conf" "$(HOME)/"
	@ln -fs "$(ROOT_DIR)/tmux/.tmux.conf.local" "$(HOME)/"

shell-dependencies:
	@ln -fs $(ROOT_DIR)/bash/.inputrc ~/.inputrc # rails console uses it
	@ln -fs $(ROOT_DIR)/asdf/.asdfrc ~/.asdfrc

zsh: shell-dependencies
	@ln -nfs "$(ROOT_DIR)/zsh/.zshrc" "$(HOME)/"

git:
	@ln -nfs "$(ROOT_DIR)/git/.git-templates" "$(HOME)/"
	@ln -fs "$(ROOT_DIR)/git/.gitconfig" "$(HOME)/"
	@cp -n "$(ROOT_DIR)/git/.gitconfig.user" "$(HOME)/"

karabiner:
	@ln -fs "$(ROOT_DIR)/karabiner" "$(HOME)/.config/karabiner"

.PHONY: nvim tmux zsh git karabiner omf shell-dependencies
