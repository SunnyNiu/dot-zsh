
_node_version() {
  local ver=$(nodenv version-name | sed -e "s/system//")
  if [[ !  -z  $ver  ]]; then
    echo " %{$fg[green]%}⬢ $ver%{$reset_color%}"
  fi
}

function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%~) $(prompt_char)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=""

local return_status=" %{$fg_bold[red]%}%(?..%?)%{$reset_color%}"
RPROMPT='${return_status}$(_awsGetProfile 2> /dev/null)$(_node_version)$(git_prompt_info)$(git_prompt_status)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[blue]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[magenta]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[yellow]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%}?"
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg_bold[magenta]%}$"