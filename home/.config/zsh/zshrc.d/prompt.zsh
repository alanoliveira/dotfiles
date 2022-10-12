VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true



function prompt_pwd() {
  prompt_segment blue $CURRENT_FG $(shrink_path -f)
}


## Main prompt
busisld_prompt() {
  RETVAL=$?
  prompt_status
#  prompt_virtualenv
#  prompt_aws
#  prompt_context
# prompt_dir
  prompt_pwd
  prompt_git
#  prompt_bzr
#  prompt_hg
  prompt_end
}
