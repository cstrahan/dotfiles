# put wezterm on PATH
(( ${+commands[wezterm]} )) || () {
  if [[ ${OSTYPE} == darwin* ]]; then
    if [[ -e /Applications/WezTerm.app/Contents/MacOS/wezterm ]]; then
      PATH=/Applications/WezTerm.app/Contents/MacOS:$PATH
    fi
  fi
}

(( ${+commands[wezterm]} )) && () {
  local command=${commands[wezterm]}

  # if it hasn't already been loaded,
  # load wezterm shell integration
  if ! (( $+functions[__wezterm_set_user_var])); then
    local integrationfile=$1/wezterm.zsh
    source $integrationfile
  fi

  # generating completions
  local compfile=$1/functions/_wezterm
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    $command shell-completion --shell zsh >| $compfile
    print -u2 -PR "* Detected a new version of 'wezterm'. Regenerated completions."
  fi
} ${0:h}
