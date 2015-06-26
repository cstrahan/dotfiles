export GIT_EDITOR="vim"
export EDITOR="vim"

if [[ "$(uname)" == "Darwin" ]] & [[ -e $HOME/.nix-profile/etc/ca-bundle.crt ]]; then
  export GIT_SSL_CAINFO=$HOME/.nix-profile/etc/ca-bundle.crt
fi

if command -v /usr/libexec/java_home >/dev/null 2>&1; then
  export JAVA_HOME=$(/usr/libexec/java_home)
fi

if command -v /usr/local/bin/brew >/dev/null 2>&1; then
  export MONO_GAC_PREFIX=`/usr/local/bin/brew --prefix`
elif command -v brew >/dev/null 2>&1; then
  export MONO_GAC_PREFIX=`brew --prefix`
fi

export PYTHONSTARTUP=~/.pystartup

export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

# make man colorful
export GROFF_NO_SGR=1
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[1;31m'        # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;33;146m'   # begin underline

# Cleaner Rails log entries
export LOGRAGE_ENABLED=true

# Don't let Nix page output
export NIX_PAGER=cat
