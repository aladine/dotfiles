user="%n"
host="%m"
directory="%~"
#local smiley="%(?,%{$fg[green]%}âº %{$reset_color%},%{$fg[red]%}â¹ %{$reset_color%})"
local smiley="%(?,%{$fg[green]%}* %{$reset_color%},%{$fg[red]%}* %{$reset_color%})"

PROMPT=$'$fg[white]$user@$host%f $fg[red]$directory%f $fg[white]($(rvm-prompt))%f $(git_prompt_info)\n$smiley'

ZSH_THEME_GIT_PROMPT_PREFIX="$fg[green]["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
#ZSH_THEME_GIT_PROMPT_DIRTY=" â"
ZSH_THEME_GIT_PROMPT_DIRTY=" *"
ZSH_THEME_GIT_PROMPT_CLEAN=""
