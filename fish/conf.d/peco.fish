set peco_default_flags --initial-filter SmartCase 

function peco_select_history
  history | peco $peco_default_flags --query (commandline) | read -l peco_ret

  if test $peco_ret
    commandline $peco_ret
  end
end

function peco_select_file
  set -l local_flags --query (commandline -t) --initial-filter Fuzzy
  ag --ignore .git --hidden -l 2> /dev/null | peco $peco_default_flags $local_flags | read -l peco_ret
  if test $peco_ret
    commandline -rt $peco_ret
  end
end

function peco_jump_to_z_dir
  z -l 2> /dev/null | sort -rn | cut -c 12- | peco $peco_default_flags | read -l peco_ret
  if test $peco_ret
    cd $peco_ret
    commandline -f repaint
  end
end

function peco_select_git_branch
  git status &>/dev/null
  if test ! $status -eq 0
    return
  end

  git branch | cut -c 3- | peco $peco_default_flags | read -l peco_ret
  if test $peco_ret
    commandline -i $peco_ret
  end
end

function peco_kill_process
  ps -ef | peco | awk '{ print $2 }' | read -l wanted_pid
  if [ $wanted_pid ]
    kill $wanted_pid
  end
end
