typeset -g ZSH_SYSTEM_CLIPBOARD_TMUX_SUPPORT='true'

export VI_MODE_SET_CURSOR=true
export WORDCHARS=$WORDCHARS:s:/:

source "$ZDOTDIR/plugins.zsh"
source "$ZDOTDIR/fzf.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/bindings.zsh"
source "$ZDOTDIR/completions.zsh"
source "$ZDOTDIR/history.zsh"

eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

if [[ -z $TMUX ]]; then
  tmux new-session -A -s "main"
fi
