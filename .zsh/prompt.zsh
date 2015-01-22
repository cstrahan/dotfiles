# TODO: use vcprompt

# http://stackoverflow.com/questions/689765/
autoload -U colors && colors
autoload -Uz add-zsh-hook
autoload -Uz promptinit && promptinit
setopt prompt_subst

function set_term_title {
  printf "\e]2;%s\a" "$PWD"
}

function set_term_tab {
  printf "\ek%s\e\\" "$PWD:h:t/$PWD:t"
}

function set_prompt {
  local nix_shell
  if [ -n "$IN_NIX_SHELL" ]; then
    nix_shell="%{$fg[yellow]%}(nix-shell)%{$reset_color%} "
  fi

  local branch_name="$(git_branch_name)"
  if [ -n "$branch_name" ]; then
    branch_name="%{$fg[green]%}($branch_name)%{$reset_color%} "
  fi

  export PS1=$'\n%{$fg_bold[blue]%}${PWD/#$HOME/~}%{$reset_color%} '"$nix_shell"''"$branch_name"'%{$fg_bold[cyan]%}λ%{$reset_color%} '
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
