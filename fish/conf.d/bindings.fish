function fish_user_key_bindings
    fish_vi_key_bindings
    bind -M default ge backward-word backward-word forward-word backward-char
    bind -M default gE backward-bigword backward-bigword forward-bigword backward-char
    for mode in insert default
      bind -M $mode \cf     forward-char
      bind -M $mode \cb     backward-char
      bind -M $mode \cr     peco_select_history
      bind -M $mode \ct     peco_select_file
      bind -M $mode \ec     peco_jump_to_z_dir
      bind -M $mode \cxb    peco_select_git_branch
      bind -M $mode \cxr    reload_shell
      bind -M $mode \cp     up-or-search
      bind -M $mode \cn     down-or-search
      bind -M $mode \ce     tmux_fpp
      bind -M $mode ! bind_bang
      bind -M $mode '$' bind_dollar
    end
    for mode in insert default visual
      bind -M $mode \cxm toggle_mode
      bind -M $mode \cxk peco_kill_process
    end
end
