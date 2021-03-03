# custome prompt 
function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}
function prompt_color {
	if [ $UID -eq 0 ]; then echo "red"; else echo "green"; fi
}

#PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%~) $(git_prompt_info)$(prompt_char)%{$reset_color%} '
PROMPT='%{$fg_bold[$(prompt_color)]%}%n@%m %{$fg_bold[blue]%}%(!.%1~.%~) $(git_prompt_info)$(prompt_char)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "
