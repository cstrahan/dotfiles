# http://stackoverflow.com/questions/689765/
autoload -U colors && colors

zmodload zsh/datetime
zmodload zsh/stat

setopt prompt_subst

function set_term_title {
  echo -ne "\e]2;$PWD\a"
}

function set_term_tab {
  echo -ne "\e]1;$PWD:h:t/$PWD:t\a"
}

function set_prompt {
  export PS1=$'\n%{$fg_bold[blue]%}${PWD/#$HOME/~}%{$reset_color%} %{$fg_bold[cyan]%}λ%{$reset_color%} '
  export PS2='%{$fg_bold[cyan]%}>%{$reset_color%} '

  PROMPT_GIT_BRANCH=$(git_branch_name)
  PROMPT_GIT_AUTHOR=$(git_author_name)

  if [ -n "$PROMPT_GIT_BRANCH" ]; then
    export PS1=$'\n%{$fg_bold[blue]%}${PWD/#$HOME/~}%{$reset_color%} %{$fg[green]%}($PROMPT_GIT_AUTHOR: $PROMPT_GIT_BRANCH)%{$reset_color%} %{$fg_bold[cyan]%}λ%{$reset_color%} '
  fi
}

function git_branch_name() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function git_author_name() {
  git config --get user.name | sed 's/\([a-zA-Z+]\)[a-zA-Z]* */\1/g' | tr '[A-Z]' '[a-z]'
}

precmd() {
  set_term_title
  set_term_tab
  set_prompt
}
