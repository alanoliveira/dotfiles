# Read current theme
test -f $OMF_CONFIG/theme
and read -l theme <$OMF_CONFIG/theme
or set -l theme default

set -l theme_functions_path {$OMF_CONFIG,$OMF_PATH}/themes*/$theme/functions/
for conf in $theme_functions_path/*.fish
    source $conf
end

set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_visual underscore

if test $theme = agnoster; and test "$fish_key_bindings" = fish_vi_key_bindings
    set color_vi_mode_normal cyan
    set color_vi_mode_insert white
    set color_vi_mode_visual magenta
    set cursor_vi_mode_normal box_steady
    set cursor_vi_mode_insert bar_steady
    set cursor_vi_mode_visual underline_steady

    function get_vi_mode_name
        switch $fish_bind_mode
            case default
                echo normal
            case replace_one
                echo normal
            case '*'
                echo $fish_bind_mode
        end
    end

    function prompt_vi_mode_custom
        set mode (get_vi_mode_name)
        set color_bg "color_vi_mode_$mode"
        # set mode_indicator (string upper (string sub -l 1 $mode))
        prompt_segment $$color_bg $color_vi_mode_indicator ''
    end

    function change_vi_mode_prompt
        set mode (get_vi_mode_name)
        set cursor_vi_mode_var "cursor_vi_mode_$mode"
        set -l cursor_code (fish_cursor_name_to_code $$cursor_vi_mode_var)
        printf "\e[\x3$cursor_code q"
    end

    function fish_prompt
        set -g RETVAL $status
        prompt_status
        prompt_virtual_env
        prompt_user
        prompt_dir
        if [ (cwd_in_scm_blacklist | wc -c) -eq 0 ]
            type -q hg; and prompt_hg
            type -q git; and prompt_git
            if [ "$theme_svn_prompt_enabled" = yes ]
                type -q svn; and prompt_svn
            end
        end
        prompt_vi_mode_custom
        change_vi_mode_prompt
        prompt_finish
    end

    function fish_right_prompt
    end
end
