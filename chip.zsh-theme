export LSCOLORS="ExBxcxdxbxegedabagacad"

user="%n"
host="%m"
directory="%~"
local smiley="%(?,%{$fg[green]%}☺ %{$reset_color%},%{$fg[red]%}☹ %{$reset_color%})"

PROMPT=$'$fg[white]$user@$host%f $fg[blue]$directory%f $(git_prompt_info)\n$smiley'

ZSH_THEME_GIT_PROMPT_PREFIX="$fg[blue]["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
#ZSH_THEME_GIT_PROMPT_DIRTY=" ✗"
ZSH_THEME_GIT_PROMPT_DIRTY=" ●"
ZSH_THEME_GIT_PROMPT_CLEAN=""
