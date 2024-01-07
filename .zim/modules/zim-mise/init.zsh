(( ${+commands[mise]} )) && () {
  local command=${commands[mise]}

  # generating activation file
  local activatefile=$1/mise-activate.zsh
  if [[ ! -e $activatefile || $activatefile -ot $command ]]; then
    $command activate zsh >| $activatefile
    zcompile -UR $activatefile
  fi

  source $activatefile
  source <($command hook-env -s zsh)

  # generating completions
  local compfile=$1/functions/_mise
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    $command complete --shell zsh >| $compfile
    print -u2 -PR "* Detected a new version 'mise'. Regenerated completions."
  fi
} ${0:h}
