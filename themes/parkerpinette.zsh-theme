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

function git_prompt_info() {
      ref=$(git symbolic-ref HEAD 2> /dev/null) || return
        echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# Display [user@host] only on non-mac hosts
uath=""
[[ `uname` != 'Darwin' ]] && uath="[%n@%m]"

PROMPT='$uath\
%{$fg[yellow]%}\
%{$reset_color%}\
%{$fg[green]%}%c \
$(git_prompt_info)\
%{$fg[red]%}%(!.#.»)%{$reset_color%} '
RPS1="%{$fg[blue]%}$(collapse_pwd)%{$reset_color%} ${return_code} "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}:: %{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$fg[yellow]%}"
