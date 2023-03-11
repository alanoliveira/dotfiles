typeset -g ZSH_SYSTEM_CLIPBOARD_TMUX_SUPPORT='true'
setopt appendhistory

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
export VI_MODE_SET_CURSOR=true
export EDITOR=nvim
export MANPAGER='nvim +Man!'
export WORDCHARS=$WORDCHARS:s:/:
export PERSONAL_WIKI_PATH=$HOME/Dropbox/vimwiki/
export DOTFILES_PATH=$HOME/.dotfiles/

source "$XDG_CONFIG_HOME/zsh/plugins.zsh"

case "$OSTYPE" in
    darwin*)
        alias tac='tail -r'
        ;;
    linux*)
        ;;
esac

alias e=$EDITOR
alias vim=nvim
alias ls='exa --icons'
alias cat='bat --style=auto'
alias ps=procs
alias ll='ls -alF --sort=modified'
alias t=todo.sh
alias lg=lazygit
alias docker=podman
eval "$(zoxide init zsh)"

for file in $XDG_CONFIG_HOME/zsh/zshrc.d/**/*(.); do
    source "$file"
done

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

$XDG_CONFIG_HOME/scripts/tmux-start.sh
