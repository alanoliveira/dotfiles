#!/usr/bin/env bash

dark_mode=$([[ $(date +%k) -ge 20 || $(date +%k) -le 8 ]] && echo 1 || echo 0)
cur_dark_mode=$(toml get --raw $PERSONAL_SETTINGS settings.darkmode)
if [[ $dark_mode != $cur_dark_mode ]]; then
  toml set $PERSONAL_SETTINGS settings.darkmode $dark_mode > $PERSONAL_SETTINGS

  alacritty_theme=nightfox/dayfox.yml
  if [[ $dark_mode = 1 ]]; then
    alacritty_theme=nightfox/nightfox.yml
  fi
  cp $XDG_CONFIG_HOME/alacritty/themes/$alacritty_theme $XDG_CONFIG_HOME/alacritty/theme.yml
  touch $XDG_CONFIG_HOME/alacritty/alacritty.yml

  tmux set-environment -g DARK_MODE $dark_mode
  tmux source-file $XDG_CONFIG_HOME/tmux/tmux.conf

  killall -USR1 nvim 2> /dev/null
fi
