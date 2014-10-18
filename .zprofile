#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Nix
#

if [[ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]]; then
  . $HOME/.nix-profile/etc/profile.d/nix.sh;
fi

#
# XQuartz
#

if [ "$(uname)" = "Darwin" -a -n "$NIX_LINK" -a -f $NIX_LINK/etc/X11/fonts.conf ]; then
  export FONTCONFIG_FILE=$NIX_LINK/etc/X11/fonts.conf
fi

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

export GOPATH="$HOME/go"

typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  $HOME/.nix-profile/bin
  /usr/texbin
  $HOME/.cabal/bin
  /usr/local/{bin,sbin}
  /usr/local/opt/gpg-agent/libexec/
  $HOME/bin
  $GOPATH/bin
  /usr/games/bin
  $path
)
path=($^path(-/N))


#
# Man
#

MANPATH=/usr/share/man:/usr/local/share/man
if [[ -d $HOME/.nix-profile ]]; then
  export MANPATH="$HOME/.nix-profile/share/man${MANPATH:+:$MANPATH}"
fi


#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-g -i -M -R -S -w -z-4'

# Set the Less input preprocessor.
if (( $+commands[lesspipe.sh] )); then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi

#
# Temporary Files
#

if [[ -d "$TMPDIR" ]]; then
  export TMPPREFIX="${TMPDIR%/}/zsh"
  if [[ ! -d "$TMPPREFIX" ]]; then
    mkdir -p "$TMPPREFIX"
  fi
fi

#
# Ruby
#

if [[ -s /usr/local/share/chruby/chruby.sh ]] ; then
  source /usr/local/share/chruby/chruby.sh

  if [[ -s ~/.ruby-version ]] ; then
    chruby $(cat ~/.ruby-version) >/dev/null
  fi
fi

#
# Ruby-Build
#

export RUBY_BUILD_CACHE_PATH=~/.ruby-build-cache
