export EDITOR=nvim

source "$XDG_CONFIG_HOME/zsh/.zplugrc"
source "$XDG_CONFIG_HOME/asdf-direnv/zshrc"

typeset -g ZSH_SYSTEM_CLIPBOARD_TMUX_SUPPORT='true'

case "$OSTYPE" in
    darwin*)
        alias tac='tail -r'
        ;;
    linux*)
        alias fd=fdfind
        ;;
esac

alias ls=exa
alias ll='ls -alF --icons'
alias vi=vim
alias vim=nvim
alias lg=lazygit
alias rofi=rofi -c ~/.config/rofi/config.rasi

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

for file in $XDG_CONFIG_HOME/zsh/zshrc.d/**/*(.); do
    source "$file"
done

if [[ $VIM && -f $XDG_CONFIG_HOME/zsh/.p10k_vim.zsh ]]; then
    source $XDG_CONFIG_HOME/zsh/.p10k_vim.zsh
else
    [[ ! -f $XDG_CONFIG_HOME/zsh/.p10k.zsh ]] || source $XDG_CONFIG_HOME/zsh/.p10k.zsh
fi
