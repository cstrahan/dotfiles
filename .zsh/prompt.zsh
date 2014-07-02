# TODO: use vcprompt

# http://stackoverflow.com/questions/689765/
autoload -U colors && colors
setopt prompt_subst

function set_term_title {
  local set_title="\e]2;$PWD\a"
  echo -ne "$set_title"

  #if [ -n "$TMUX" ]; then
  #  echo -ne "\ePtmux;\e$set_title\e\\"
  #fi
}

function set_term_tab {
  local set_tab="\e]1;$PWD:h:t/$PWD:t\a"
  echo -ne "$set_tab"

  #if [ -n "$TMUX" ]; then
  #  echo -ne "\ePtmux;\e$set_tab\e\\"
  #fi
}

function set_prompt {
  local branch_name="$(git_branch_name)"
  if [ -n "$branch_name" ]; then
    branch_name="%{$fg[green]%}($branch_name)%{$reset_color%} "
  fi

  export PS1=$'\n%{$fg_bold[blue]%}${PWD/#$HOME/~}%{$reset_color%} '"$branch_name"'%{$fg_bold[cyan]%}λ%{$reset_color%} '
  export PS2='%{$fg_bold[cyan]%}>%{$reset_color%} '
}

function git_branch_name() {
  print "$(exec 2>/dev/null; git branch | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
}

precmd() {
  set_term_title
  set_term_tab
  set_prompt
}
