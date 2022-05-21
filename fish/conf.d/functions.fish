# cd to the dir of the given file
function cdd --wraps cd --description 'cd (dirname $argv)'
    builtin cd (dirname $argv)
end

function toggle_mode
  if test "$fish_key_bindings" = fish_vi_key_bindings
    set -U fish_key_bindings fish_default_key_bindings  
  else
    set -U fish_key_bindings fish_vi_key_bindings
  end
  commandline -f repaint
end

function reload_shell
  exec $SHELL -l
end

function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t $history[1]; commandline -f repaint
        case "*"
            commandline -i !
    end
end

function bind_dollar
    switch (commandline -t)[-1]
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end
