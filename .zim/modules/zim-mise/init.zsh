# Makes Mise work in MSYS2/Cygwin; see
# https://github.com/jdx/mise/discussions/3961#discussioncomment-18223204
if [[ -n "$MSYSTEM" ]]; then
  () {
    # PowerShell-launched sessions may already have activated mise.
    [[ -z "${__MISE_ORIG_PATH+X}" ]] || return

    local command
    if command -v mise.exe >/dev/null 2>&1; then
      command="$(/usr/bin/cygpath -u "$(command -v mise.exe)")"
    fi
    [[ -x $command ]] || return

    typeset -g _MISE_EXE_UNIX=$command
    export MISE_EXE=$command MISE_SHELL=zsh

    __mise_fix_path() {
      export PATH="$(/usr/bin/cygpath -u -p "$PATH")"
    }

    # Non-interactive: shims only. Full hooks belong in interactive shells.
    if [[ ! -o interactive ]]; then
      local shims="$(/usr/bin/cygpath -u "$HOME/AppData/Local/mise/shims")"
      if [[ ":$PATH:" != *":$shims:"* ]]; then
        eval "$($command activate zsh --shims)"
        __mise_fix_path
      fi
      return
    fi

    local cachedir=$1

    # Cache patched activate (current mise inlines the exe path and has no
    # static export PATH= line; hook-env is what rewrites PATH).
    local activatefile=$cachedir/mise-activate.zsh
    if [[ ! -e $activatefile || $activatefile -ot $command ]]; then
      local mise_activate_script
      mise_activate_script="$($command activate zsh)"
      mise_activate_script="$(printf '%s\n' "$mise_activate_script" \
        | sed -E "s@[A-Za-z]:\\\\[^\"']*\\\\mise\\.exe@${command}@g")"
      print -r -- "$mise_activate_script" >| $activatefile
      zcompile -UR $activatefile
    fi
    source $activatefile
    export MISE_EXE=$command MISE_SHELL=zsh

    # hook-env and mise deactivate|shell emit Windows PATH. Convert after each.
    if (( $+functions[_mise_hook] )); then
      functions[_mise_hook_raw]=$functions[_mise_hook]
      _mise_hook() {
        _mise_hook_raw "$@"
        __mise_fix_path
      }
    fi
    if (( $+functions[mise] )); then
      functions[_mise_cmd_raw]=$functions[mise]
      mise() {
        _mise_cmd_raw "$@"
        __mise_fix_path
      }
    fi
    __mise_fix_path

    local compfile=$cachedir/functions/_mise
    [[ -d ${compfile:h} ]] || mkdir -p ${compfile:h}
    if [[ ! -e $compfile || $compfile -ot $command ]]; then
      $command complete --shell zsh >| $compfile
      print -u2 -PR "* Detected a new version of 'mise'. Regenerated completions."
    fi
    fpath+=(${compfile:h})
  } ${0:h}

elif (( ${+commands[mise]} )); then
  () {
    local command=${commands[mise]}

    if [[ ! -o interactive ]]; then
      eval "$($command activate zsh --shims)"
      return
    fi

    local activatefile=$1/mise-activate.zsh
    if [[ ! -e $activatefile || $activatefile -ot $command ]]; then
      $command activate zsh >| $activatefile
      zcompile -UR $activatefile
    fi

    source $activatefile
    source <($command hook-env -s zsh)

    local compfile=$1/functions/_mise
    [[ -d ${compfile:h} ]] || mkdir -p ${compfile:h}
    if [[ ! -e $compfile || $compfile -ot $command ]]; then
      $command complete --shell zsh >| $compfile
      print -u2 -PR "* Detected a new version of 'mise'. Regenerated completions."
    fi
    fpath+=(${compfile:h})
  } ${0:h}
fi
