() {
  local -r target=${1}
  shift
  (( ${+commands[${1}]} )) || return 1
  if [[ ! ( -s ${target} && ${target} -nt ${commands[${1}]} ) ]]; then
    "${@}" >! ${target} || return 1
    zcompile -UR ${target}
  fi
  source ${target}
} ${0:h}/atuin--zsh.zsh atuin init zsh || return 1

() {
  builtin emulate -L zsh
  local -r target_dir=${1}
  shift

  (( ${+commands[${1}]} )) || return 1

  local -r compfile=$target_dir/functions/_${1}
  if [[ ! -e $compfile || $compfile -ot ${1} ]]; then
    "${@}" >| $compfile
    print -u2 -PR "* Detected a new version '${1}'. Regenerated completions."
  fi
} ${0:h} atuin gen-completions --shell zsh
