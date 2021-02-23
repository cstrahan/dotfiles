# -*- mode: Sh; -*-
# vim: ts=4 sts=4 shiftwidth=4 expandtab ft=sh

# Sources:
# https://github.com/rtomayko/dotfiles/
# https://github.com/ryanb/dotfiles/
# PeepCode's Advanced Shell Scripting

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# the basics
: ${HOME=~}
: ${LOGNAME=$(id -un)}
: ${UNAME=$(uname)}

export GOPATH=$HOME/go

# complete hostnames from this file
: ${HOSTFILE=~/.ssh/known_hosts}

# readline config
: ${INPUTRC=~/.inputrc}

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# ----------------------------------------------------------------------
#  Nix
# ----------------------------------------------------------------------

nixSetup () {
    # Handle Nixpkgs using a different glibc locale archive version
    # https://github.com/NixOS/nixpkgs/issues/38991#issuecomment-496332104
    #
    # Use home-manager if available.
    if [ -e $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh ]; then
        . $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
    else
        export LOCALE_ARCHIVE_2_27="$(nix-build --no-out-link "<nixpkgs>" -A glibcLocales)/lib/locale/locale-archive"
    fi
}

# Handle non-NixOS installs.
if [ -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]; then
    # Multi-user (i.e. daemon) setups.

    # Normally /etc/profile.d/nix.sh sources this, but that only applies to
    # login shells, so we'll go ahead and source that here.
    . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

    nixSetup
elif [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
    # Single-user installs.

    . $HOME/.nix-profile/etc/profile.d/nix.sh

    nixSetup
fi

unset -f nixSetup

# ----------------------------------------------------------------------
# bash-preexec
# ----------------------------------------------------------------------
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh

# ----------------------------------------------------------------------
# ghcup
# ----------------------------------------------------------------------

[ -f ~/.ghcup/env ] && source ~/.ghcup/env

# ----------------------------------------------------------------------
# Node Version Manager
# ----------------------------------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ----------------------------------------------------------------------
# Deno
# ----------------------------------------------------------------------

export DENO_INSTALL="/home/cstrahan/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# ----------------------------------------------------------------------
# VTE terminal support
# ----------------------------------------------------------------------

if [[ $TERM == xterm-termite ]]; then
    vte_script=$(find /etc/profile.d -maxdepth 1 -name "vte*.sh" | sort -rV  | head -n 1)
    if [[ -n "$vte_script" ]]; then
        . "$vte_script"
        __vte_prompt_command
    fi
    unset vte_script
fi

# ----------------------------------------------------------------------
#  direnv
# ----------------------------------------------------------------------
if command -v direnv >/dev/null 2>&1; then
    eval "$(direnv hook bash)"
fi

# ----------------------------------------------------------------------
#  nodejs/npm
# ----------------------------------------------------------------------

# make global packages install in ~/.local/bin (note: this conflicts with nvm)
#export npm_config_prefix=$HOME/.local

# ----------------------------------------------------------------------
#  RVM
# ----------------------------------------------------------------------

#if [[ -f "/usr/local/rvm/scripts/rvm" ]] && groups | grep -q rvm ; then
#    source "/usr/local/rvm/scripts/rvm"
#    if [[ -r $rvm_path/scripts/completion ]] ; then source $rvm_path/scripts/completion ; fi
#elif [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
#    source "$HOME/.rvm/scripts/rvm"
#    if [[ -r $rvm_path/scripts/completion ]] ; then source $rvm_path/scripts/completion ; fi
#fi
#
#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# ----------------------------------------------------------------------
#  chruby
# ----------------------------------------------------------------------

if [[ -s /usr/local/share/chruby/chruby.sh ]] ; then
    source /usr/local/share/chruby/chruby.sh
fi

function chruby-rehash {
    RUBIES=("$HOME"/.rubies/*)
}

# ----------------------------------------------------------------------
#  ruby-build
# ----------------------------------------------------------------------

export RUBY_BUILD_CACHE_PATH=~/.ruby-build-cache

# ----------------------------------------------------------------------
#  Auto Jump
# ----------------------------------------------------------------------

if command -v brew >/dev/null 2>&1 && [ -f `brew --prefix`/etc/autojump ]; then
  . `brew --prefix`/etc/autojump
fi

# ----------------------------------------------------------------------
#  SHELL OPTIONS
# ----------------------------------------------------------------------

# Don't use CTRL+s and CTRL+q for terminal control flow:
stty stop undef
stty start undef

# bring in system bashrc
test -r /etc/bashrc &&
      . /etc/bashrc
test -r /etc/bash.bashrc &&
      . /etc/bash.bashrc

# default umask
umask 0022

# we want the various sbins on the path along with /usr/local/bin
PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"
PATH="/usr/local/bin:$PATH"
PATH="$PATH:$HOME/go/bin"
PATH="$PATH:/usr/local/go/bin"

# put ~/.local/bin on PATH if you have it
test -d "$HOME/.local/bin" &&
PATH="$HOME/.local/bin:$PATH"

# ----------------------------------------------------------------------
# ENVIRONMENT CONFIGURATION
# ----------------------------------------------------------------------

# enable en_US locale w/ utf-8 encodings if not already configured
: ${LANG:="en_US.UTF-8"}
: ${LANGUAGE:="en"}
: ${LC_CTYPE:="en_US.UTF-8"}
: ${LC_ALL:="en_US.UTF-8"}
export LANG LANGUAGE LC_CTYPE LC_ALL

# always use PASSIVE mode ftp
: ${FTP_PASSIVE:=1}
export FTP_PASSIVE

# ignore backups, CVS directories, python bytecode, vim swap files
FIGNORE="~:CVS:#:.pyc:.swp:.swa:apache-solr-*"

# history stuff
# don't put duplicate lines or lines starting with space in the history
# append to the history file, don't overwrite it
# https://unix.stackexchange.com/questions/18212/bash-history-ignoredups-and-erasedups-setting-conflict-with-common-history<Paste>
HISTCONTROL=ignoreboth
shopt -s histappend
# append to history when printing the prompt
PROMPT_COMMAND="builtin history -a${PROMPT_COMMAND:+";"}$PROMPT_COMMAND"
HISTFILESIZE=10000
HISTSIZE=10000

# ----------------------------------------------------------------------
# PAGER / EDITOR
# ----------------------------------------------------------------------

# EDITOR
if command -v nvim >/dev/null 2>&1; then
    EDITOR=nvim
    alias vi=nvim
elif command -v vim >/dev/null 2>&1; then
    EDITOR=vim
    alias vi=vim
else
    EDITOR=vi
fi
export EDITOR

# PAGER
LESS="FirSwX"
export LESS

if test -n "$(command -v less)" ; then
    PAGER="less -FirSwX"
    MANPAGER="less -FiRswX"
else
    PAGER=more
    MANPAGER="$PAGER"
fi
export PAGER MANPAGER

# Ack
ACK_PAGER="$PAGER"
ACK_PAGER_COLOR="$PAGER"

# ----------------------------------------------------------------------
# PROMPT
# ----------------------------------------------------------------------

# Colors from http://wiki.archlinux.org/index.php/Color_Bash_Prompt
# misc
ESC=$(printf "\e")
NO_COLOR=$ESC'[0m' #disable any colors
# regular colors
BLACK=$ESC'[0;30m'
RED=$ESC'[0;31m'
GREEN=$ESC'[0;32m'
YELLOW=$ESC'[0;33m'
BLUE=$ESC'[0;34m'
MAGENTA=$ESC'[0;35m'
CYAN=$ESC'[0;36m'
WHITE=$ESC'[0;37m'
# emphasized (bolded) colors
EBLACK=$ESC'[1;30m'
ERED=$ESC'[1;31m'
EGREEN=$ESC'[1;32m'
EYELLOW=$ESC'[1;33m'
EBLUE=$ESC'[1;34m'
EMAGENTA=$ESC'[1;35m'
ECYAN=$ESC'[1;36m'
EWHITE=$ESC'[1;37m'
# underlined colors
UBLACK=$ESC'[4;30m'
URED=$ESC'[4;31m'
UGREEN=$ESC'[4;32m'
UYELLOW=$ESC'[4;33m'
UBLUE=$ESC'[4;34m'
UMAGENTA=$ESC'[4;35m'
UCYAN=$ESC'[4;36m'
UWHITE=$ESC'[4;37m'
# background colors
BBLACK=$ESC'[40m'
BRED=$ESC'[41m'
BGREEN=$ESC'[42m'
BYELLOW=$ESC'[43m'
BBLUE=$ESC'[44m'
BMAGENTA=$ESC'[45m'
BCYAN=$ESC'[46m'
BWHITE=$ESC'[47m'

_jobscount() {
    local jobs=($(jobs -p))
    local count=${#jobs[@]}
    (($count)) && echo -n " (${count}j)"
}

VCPROMPT=""
if test -n "$(command -v vcprompt)"; then
    VCPROMPT=" \$(vcprompt -f '(%b)')"
fi

PS1="\n\[$ERED\]┏━ \[$EGREEN\]\u\[$EWHITE\]@\[$EGREEN\]\h\[$NO_COLOR\]:\[$EBLUE\]\w\[$EMAGENTA\]$VCPROMPT\[$ERED\]\$(_jobscount)\[$NO_COLOR\] \n\[$ERED\]┗┫\[$NO_COLOR\] "
PS2="\[$ERED\] ┃ \[$NO_COLOR\]"

# ----------------------------------------------------------------------
# MACOS X / DARWIN SPECIFIC
# ----------------------------------------------------------------------

if [ "$UNAME" = Darwin ]; then
    test -x /usr/pkg -a ! -L /usr/pkg && {
        PATH="/usr/pkg/sbin:/usr/pkg/bin:$PATH"
        MANPATH="/usr/pkg/share/man:$MANPATH"
    }

    # setup java environment. puke.
    JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
    ANT_HOME="/Developer/Java/Ant"
    export ANT_HOME JAVA_HOME

    # hold jruby's hand
    test -d /opt/jruby &&
    JRUBY_HOME="/opt/jruby"
    export JRUBY_HOME
fi

# ----------------------------------------------------------------------
# ALIASES / FUNCTIONS
# ----------------------------------------------------------------------

# make man colorful
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# disk usage with human sizes and minimal depth
alias du1='du -h --max-depth=1'
alias fn='find . -name'
alias hi='history | tail -20'

# Make tmux use 256 colors by default
alias tmux='command tmux -2'

# Git aliases
alias gp='git push origin HEAD'
alias gaa='git add --all'
alias gpom='git push origin master'
alias gst='git status -sb'
alias gci='git commit'
alias gcim='git commit -m'
alias gcia='git commit --amend'
alias gco='git co'
alias gdi='git diff'
alias gdc='git diff --cached'
alias glg='git lg'
alias getch='git fetch'
alias gitx='gitx --all'
alias gfix='git fix'
alias gplu='git pull upstream HEAD'
alias gplo='git pull origin HEAD'

alias k='kubectl'
complete -F __start_kubectl k

# ----------------------------------------------------------------------
# BASH COMPLETION
# ----------------------------------------------------------------------

test -z "$BASH_COMPLETION" && {
    bash=${BASH_VERSION%.*}; bmajor=${bash%.*}; bminor=${bash#*.}
    test $bmajor -gt 1 && {
        # search for a bash_completion file to source
        for f in /usr/local/etc/bash_completion \
                 /usr/pkg/etc/bash_completion \
                 /opt/local/etc/bash_completion \
                 /usr/share/bash-completion/bash_completion \
                 /etc/bash_completion
        do
            test -f $f && {
                . $f
                break
            }
        done
    }
    unset bash bmajor bminor
}

# override and disable tilde expansion
_expand() {
    return 0
}

# ----------------------------------------------------------------------
# LS AND DIRCOLORS
# ----------------------------------------------------------------------

# we always pass these to ls(1)
if [ "$UNAME" = Linux ]; then
    LS_COMMON="-hBG --color=auto"
else
    # OSX/BSD's ls is a little different...
    LS_COMMON="-hBG"
fi

# if the dircolors utility is available, set that up to
dircolors="$(type -P gdircolors dircolors | head -1)"
test -n "$dircolors" && {
    COLORS=/etc/DIR_COLORS
    test -e "/etc/DIR_COLORS.$TERM"   && COLORS="/etc/DIR_COLORS.$TERM"
    test -e "$HOME/.dircolors"        && COLORS="$HOME/.dircolors"
    test ! -e "$COLORS"               && COLORS=
    eval `$dircolors --sh $COLORS`
}
unset dircolors

# setup the main ls alias if we've established common args
test -n "$LS_COMMON" &&
alias ls="command ls $LS_COMMON"

# these use the ls aliases above
alias ll="ls -l"
alias l.="ls -d .*"

# ----------------------------------------------------------------------
# PATH MANIPULATION FUNCTIONS
# ----------------------------------------------------------------------

# Usage: pls [<var>]
# List path entries of PATH or environment variable <var>.
pls () { eval echo \$${1:-PATH} |tr : '\n'; }

# Usage: pshift [-n <num>] [<var>]
# Shift <num> entries off the front of PATH or environment var <var>.
# with the <var> option. Useful: pshift $(pwd)
pshift () {
    local n=1
    [ "$1" = "-n" ] && { n=$(( $2 + 1 )); shift 2; }
    eval "${1:-PATH}='$(pls |tail -n +$n |tr '\n' :)'"
}

# Usage: ppop [-n <num>] [<var>]
# Pop <num> entries off the end of PATH or environment variable <var>.
ppop () {
    local n=1 i=0
    [ "$1" = "-n" ] && { n=$2; shift 2; }
    while [ $i -lt $n ]
    do eval "${1:-PATH}='\${${1:-PATH}%:*}'"
       i=$(( i + 1 ))
    done
}

# Usage: prm <path> [<var>]
# Remove <path> from PATH or environment variable <var>.
prm () { eval "${2:-PATH}='$(pls $2 |grep -v "^$1\$" |tr '\n' :)'"; }

# Usage: punshift <path> [<var>]
# Shift <path> onto the beginning of PATH or environment variable <var>.
punshift () { eval "${2:-PATH}='$1:$(eval echo \$${2:-PATH})'"; }

# Usage: ppush <path> [<var>]
ppush () { eval "${2:-PATH}='$(eval echo \$${2:-PATH})':$1"; }

# Usage: puniq [<path>]
# Remove duplicate entries from a PATH style value while retaining
# the original order. Use PATH if no <path> is given.
#
# Example:
#   $ puniq /usr/bin:/usr/local/bin:/usr/bin
#   /usr/bin:/usr/local/bin
puniq () {
    echo "$1" |tr : '\n' |nl |sort -u -k 2,2 |sort -n |
    cut -f 2- |tr '\n' : |sed -e 's/:$//' -e 's/^://'
}

# ----------------------------------------------------------------------
# USER SHELL ENVIRONMENT
# ----------------------------------------------------------------------

# source ~/.shenv now if it exists
test -r ~/.shenv &&
. ~/.shenv

# condense PATH entries
PATH=$(puniq $PATH)
MANPATH=$(puniq $MANPATH)

# ----------------------------------------------------------------------
#  Local Settings
# ----------------------------------------------------------------------

if [[ -s ~/.bash/local.sh ]] ; then
    source ~/.bash/local.sh
fi

# ----------------------------------------------------------------------
# MOTD / FORTUNE
# ----------------------------------------------------------------------

if [[ $- == *i* && $0 == -* ]]; then
    uname -npsr
    uptime
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
