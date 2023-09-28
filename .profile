export EDITOR=nvim
export VISUAL=$EDITOR
export MANPAGER='nvim +Man!'
export CLOUD_DIR=$(realpath $HOME/Cloud)
export DOTFILES_PATH=$HOME/.dotfiles
export BROWSER=firefox

export PATH="$HOME/bin:$HOME/.cargo/bin:$PATH"
. /opt/asdf-vm/asdf.sh
