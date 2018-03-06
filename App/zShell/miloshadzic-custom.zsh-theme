# Yay! High voltage and arrows!

CUSTOM_TIME="%{$fg[cyan]%}%T %{$reset_color%} "
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='$CUSTOM_TIME%{$fg[cyan]%}$(git_prompt_info)%{$fg[cyan]%}%1~%{$reset_color%} '
