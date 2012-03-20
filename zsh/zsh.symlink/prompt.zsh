zmodload zsh/datetime
zmodload zsh/stat

setopt prompt_subst

BATTERY_METER="$HOME/.zsh/tmp/battery"

function rvm_prompt_info {
  ruby_version=$(~/.rvm/bin/rvm-prompt i v g 2> /dev/null) || return
  echo "$ruby_version"
}

function battery_charge {
    echo `~/.zsh/bin/battery_charge` 2>/dev/null
}

function set_term_title {
  echo -ne "\e]2;$PWD\a"
}

function set_term_tab {
  echo -ne "\e]1;$PWD:h:t/$PWD:t\a"
}

function age_in_seconds {
  echo $(($EPOCHSECONDS - $(stat +mtime $1)))
}

function should_reload_battery_meter {
  [[ ! -e $BATTERY_METER ]] || [[ $(age_in_seconds $BATTERY_METER) -gt 300 ]]
}

function reload_battery_meter {
  mkdir -p "$BATTERY_METER:h"
  echo $(battery_charge) > ~/.zsh/tmp/battery
  RPROMPT='$(cat $HOME/.zsh/tmp/battery)'
}

# Prep the battery meter.
if should_reload_battery_meter; then
  reload_battery_meter
else
  RPROMPT='$(cat $HOME/.zsh/tmp/battery)'
fi

function set_prompt {
  export PS1=$'\n%{$fg_bold[blue]%}${PWD/#$HOME/~}%{$reset_color%} %{$fg_bold[cyan]%}λ%{$reset_color%} '
  export PS2='%{$fg_bold[cyan]%}>%{$reset_color%} '

  PROMPT_GIT_BRANCH=$(git_branch_name)
  PROMPT_GIT_AUTHOR=$(git_author_name)

  if [ -n "$PROMPT_GIT_BRANCH" ]; then
    export PS1=$'\n%{$fg_bold[blue]%}${PWD/#$HOME/~}%{$reset_color%} %{$fg[green]%}($PROMPT_GIT_AUTHOR: $PROMPT_GIT_BRANCH)%{$reset_color%} %{$fg_bold[cyan]%}λ%{$reset_color%} '
  fi

  should_reload_battery_meter && reload_battery_meter
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
