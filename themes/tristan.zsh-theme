__git_svn_prompt() {
    local b=''
    if [[ -d ".svn" ]];then
        brurl=(`svn info|awk '{FS="/"} /URL:/ {print $5,$6}'`)
        if [[ ${brurl[1]} == 'branches' ]];then
            b=${brurl[2]}
        else
            b=${brurl[1]}!
        fi
        b=${ZSH_THEME_GIT_PROMPT_PREFIX}${b}${ZSH_THEME_GIT_PROMPT_SUFFIX}
    else
        b=$(git_prompt_info)
    fi
    echo $b
    return
}

PROMPT='%{$fg_bold[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m:%{$fg_bold[blue]%}%c%{$reset_color%}\$$(git_prompt_info) '
# PROMPT='%{$fg_bold[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m:%{$fg_bold[blue]%}%c%{$reset_color%}\$$(__git_svn_prompt) '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[red]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

