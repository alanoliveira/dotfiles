VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true

MODE_INDICATOR_COLOR=yellow
INSERT_MODE_INDICATOR_COLOR=green
VISUAL_MODE_INDICATOR_COLOR=red
MODE_INDICATOR="%K{$MODE_INDICATOR_COLOR} %F{black}N%f %k"
INSERT_MODE_INDICATOR="%K{$INSERT_MODE_INDICATOR_COLOR} %F{black}I%f %k"
VISUAL_MODE_INDICATOR="%K{$VISUAL_MODE_INDICATOR_COLOR} %F{black}V%f %k"


prompt_vi_mode() {
  local prompt_vi_mode_color="${${VI_KEYMAP/vicmd/$MODE_INDICATOR_COLOR}/(main|viins)/$INSERT_MODE_INDICATOR_COLOR}"
  prompt_segment $prompt_vi_mode_color default
}

function prompt_pwd() {
  prompt_segment blue $CURRENT_FG $(shrink_path -f)
}


## Main prompt
build_prompt() {
  RETVAL=$?
  prompt_status
  prompt_virtualenv
  prompt_aws
  prompt_context
# prompt_dir
  prompt_pwd
  prompt_git
# prompt_vi_mode
  prompt_bzr
  prompt_hg
  prompt_end
}
