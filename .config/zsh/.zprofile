export EDITOR=nvim
export VISUAL=$EDITOR
export MANPAGER='nvim +Man!'
export PAGER="less -R"
export CLOUD_DIR=$(realpath $HOME/Cloud)
export DOTFILES_PATH=$HOME/.dotfiles
export BROWSER=firefox
export OVERMIND_TMUX_CONFIG=$HOME/.config/tmux/overmind.tmux.conf
export RI="-f ansi"

export PATH="$HOME/bin:$HOME/.cargo/bin:$PATH"

[[ ! -f /opt/asdf-vm/asdf.sh ]] || source /opt/asdf-vm/asdf.sh
