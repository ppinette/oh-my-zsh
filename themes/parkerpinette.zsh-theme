# copied from kennethreitz and steeef
function virtualenv_info {
    if { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
        [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
    else
        echo ''
    fi
}

function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='%{$fg[yellow]%}\
$(virtualenv_info)%{$reset_color%}\
%{$fg[green]%}%c \
$(git_prompt_info)\
%{$fg[red]%}%(!.#.») '
RPS1='%{$fg[blue]%}$(collapse_pwd)%{$reset_color%} ${return_code} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}:: %{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$fg[yellow]%}"

