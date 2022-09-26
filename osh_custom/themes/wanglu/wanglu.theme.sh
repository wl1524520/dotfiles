#! bash oh-my-bash.module

# This theme attempts to replicate the default "robbyrussell" theme from ohmyzsh:
#  https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/robbyrussell.zsh-theme

#added TITLEBAR for updating the tab and window titles with the pwd
case $TERM in
	xterm*)
	TITLEBAR='\[\033]0;\w\007\]'
	;;
	*)
	TITLEBAR=""
	;;
esac

function _omb_theme_PROMPT_COMMAND() {
    if [[ "$UID" == 0 ]]; then
        local arrow_color="${_omb_prompt_bold_brown}"
    else
        local arrow_color="${_omb_prompt_bold_green}"
    fi

    local base_directory="${_omb_prompt_bold_teal}\W${_omb_prompt_reset_color}"
    local GIT_THEME_PROMPT_PREFIX="${_omb_prompt_bold_navy}git:(${_omb_prompt_bold_brown}"
    local SVN_THEME_PROMPT_PREFIX="${_omb_prompt_bold_navy}svn:(${_omb_prompt_bold_brown}"
    local HG_THEME_PROMPT_PREFIX="${_omb_prompt_bold_navy}hg:(${_omb_prompt_bold_brown}"
    local SCM_THEME_PROMPT_SUFFIX="${_omb_prompt_reset_color}"
    local SCM_THEME_PROMPT_CLEAN="${_omb_prompt_bold_navy})${_omb_prompt_reset_color}"
    local SCM_THEME_PROMPT_DIRTY="${_omb_prompt_bold_navy}) ${_omb_prompt_olive}✗${_omb_prompt_reset_color}"

    # local arrow="${arrow_color}➜${_omb_prompt_reset_color}"
    local arrow="${arrow_color}\u@\h${_omb_prompt_reset_color}"

    PS1="${arrow} ${base_directory} "

    local scm_info=$(scm_prompt_info)

    PS1+=${scm_info:+$scm_info }
    PS1+=${_omb_prompt_normal}
    PS1+='\$ '
}

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
