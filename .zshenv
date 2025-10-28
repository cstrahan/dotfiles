# Ubuntu fix: prevent /etc/zsh/zshrc from running compinit
skip_global_compinit=1

# Tie PATH scalar to path array,
# keep only the first occurence,
# and export PATH to the environment.
#
# Do the same with MANPATH.
#
# See https://zsh.sourceforge.io/Doc/Release/Shell-Builtin-Commands.html
typeset -TUx PATH path
typeset -TUx MANPATH manpath

# this empty path tells man to also search the default paths,
# as would be reported by:
#
#   env -u MANPATH manpath
#
# the same could be done by leaving MANPATH unset,
# but we expect that MANPATH will be touched elsewhere,
# so explicitly set this path upfront.
manpath+=("")

# LS_COLORS
# gdircolors --sh .dircolors > .dircolors.sh
if [[ -f "$HOME/.dircolors.sh" ]]; then
  . "$HOME/.dircolors.sh"
fi

# make man colorful (overriding the defaults from Zim)
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
#export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box (grey)
export LESS_TERMCAP_so=$'\E[30;43m'       # begin standout-mode - info box (yellow, inverted)
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

if [[ ${OSTYPE} == darwin* ]]; then
  # Some software, like lazygit, will use ~/Library/Application\ Support/,
  # unless XDG_CONFIG_HOME is set.
  # Let's keep everything under ~/.config
  export XDG_CONFIG_HOME="$HOME/.config"

  # see "Discussion: longterm Homebrew prefix on Apple Silicon Macs": https://github.com/Homebrew/brew/issues/9177
  # inline the results of either:
  #   /usr/local/bin/brew shellenv
  #   /opt/homebrew/bin/brew shellenv
  if [[ -d /opt/homebrew ]]; then
    export HOMEBREW_PREFIX="/opt/homebrew";
    export HOMEBREW_REPOSITORY="/opt/homebrew";
  elif [[ -d /usr/local/Homebrew ]]; then
    export HOMEBREW_PREFIX="/usr/local";
    export HOMEBREW_REPOSITORY="/usr/local/Homebrew";
  elif [[ $(uname -m) == "arm64" ]]; then
    export HOMEBREW_PREFIX="/opt/homebrew";
    export HOMEBREW_REPOSITORY="/opt/homebrew";
  else # x86_64
    export HOMEBREW_PREFIX="/usr/local";
    export HOMEBREW_REPOSITORY="/usr/local/Homebrew";
  fi
  export HOMEBREW_CELLAR="$HOMEBREW_PREFIX/Cellar";
  path[1,0]=("$HOMEBREW_PREFIX/bin")
  path[1,0]=("$HOMEBREW_PREFIX/sbin")
  export INFOPATH="$HOMEBREW_PREFIX/share/info${INFOPATH+:$INFOPATH}";

  # completions from homebrew packages
  fpath[1,0]=("$HOMEBREW_PREFIX/share/zsh/site-functions")

  # wezterm and wezterm-gui
  if [[ -d "/Applications/WezTerm.app/Contents/MacOS" ]]; then
    path[1,0]=("/Applications/WezTerm.app/Contents/MacOS")
  fi

  export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
  path+="$ANDROID_SDK_ROOT/emulator"
  path+="$ANDROID_SDK_ROOT/platform-tools"

  if [[ -d "$HOMEBREW_PREFIX/opt/binutils/bin" ]]; then
    alias readelf="$HOMEBREW_PREFIX/opt/binutils/bin/readelf"
  fi

  if [[ -d "/Applications/kitty.app/Contents/MacOS" ]]; then
    path+="/Applications/kitty.app/Contents/MacOS"
  fi
fi

# go install stuff
path[1,0]=("$HOME/go/bin")

# local binaries
path[1,0]=("$HOME/.local/bin")

# rustup
if [[ -e "$HOME/.cargo/env" ]]; then
  . "$HOME/.cargo/env"
fi

# only load direnv if we're interactive,
# to minimize surprises in non-interactive scripts.
if [[ -o interactive ]] && (( $+commands[direnv] )); then
  eval "$(direnv hook zsh)"
fi

# editor
if (( $+commands[nvim] )); then
  export EDITOR=nvim
elif (( $+commands[vim] )); then
  export EDITOR=vim
fi
if [[ -n "$EDITOR" ]]; then
  VISUAL=$EDITOR
  SUDO_EDITOR=$commands[$EDITOR]
  alias vi=$EDITOR
fi

# Atuin history search
if [[ -e "$HOME/.atuin/bin/env" ]]; then
  . "$HOME/.atuin/bin/env"
fi

# Remove any empty path strings.
exclude=( '' )
path=("${(@)path:|exclude}")
unset exclude

# Remove paths that are either dead links (-/) or do not
# exist at all (N) and apply that to all in array (^)
# Consequently, also removes the empty string.
# See http://stackoverflow.com/a/9352979/1469693
# path=($^path(-/N))
# manpath=($^manpath(-/N))

# On macOS, /etc/profile (which is sourced after /etc/zshenv and ~/.zshenv) does:
#
#   eval `/usr/libexec/path_helper -s`
#
# Which:
#   - prepends the paths in /etc/paths and /etc/paths.d/* to PATH
#   - prepends the paths in /etc/manpaths and /etc/manpaths.d/* to MANPATH
#
# See:
#   - https://gist.github.com/Linerre/f11ad4a6a934dcf01ee8415c9457e7b2
#   - https://0xmachos.com/2021-05-13-zsh-path-macos/
#   - https://billglover.me/2024/02/08/setting-the-path-variable-on-macos-with-zsh/
#
# This, for example, puts /usr/local/bin at the front of PATH, which isn't what I want.
#
# So I'll keep track of PATH before /etc/profile screws it up,
# and in ~/.profile I'll push all of my desired paths back to the front.
if [[ ${OSTYPE} == darwin* ]]; then
  path_before_etc_profile=( "$path[@]" )
  manpath_before_etc_profile=( "$manpath[@]" )
fi

# Atuin history search
if [[ -e "$HOME/.atuin/bin/env" ]]; then
  . "$HOME/.atuin/bin/env"
fi
