# tmux set-environment DARK_MODE `[[ $(date +%H) -ge 20 || $(date +%H) -le 8 ]] && echo 1 || echo 0`

DARK_MODE=$(tmux show-environment DARK_MODE 2>/dev/null | cut -d= -f2)
if [ -z $DARK_MODE ]; then
  exit 0
fi
tmux set-environment -u DARK_MODE

ALACRITTY_THEME=nightfox/dayfox.yml
if [ "$DARK_MODE" = 1 ]; then
  ALACRITTY_THEME=nightfox/nightfox.yml
fi
cp $XDG_CONFIG_HOME/alacritty/themes/$ALACRITTY_THEME $XDG_CONFIG_HOME/alacritty/theme.yml
touch $XDG_CONFIG_HOME/alacritty/alacritty.yml

tmux set-environment DARK_THEME $DARK_MODE
tmux source-file $XDG_CONFIG_HOME/tmux/tmux.conf

killall -USR1 nvim

exit 0
