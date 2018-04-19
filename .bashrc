# -*- mode: Sh; -*-
# vim: ts=4 sts=4 shiftwidth=4 expandtab ft=sh

# Sources:
# https://github.com/rtomayko/dotfiles/
# https://github.com/ryanb/dotfiles/
# PeepCode's Advanced Shell Scripting


# the basics
: ${HOME=~}
: ${LOGNAME=$(id -un)}
: ${UNAME=$(uname)}

# complete hostnames from this file
: ${HOSTFILE=~/.ssh/known_hosts}

# readline config
: ${INPUTRC=~/.inputrc}

# ----------------------------------------------------------------------
#  Nix
# ----------------------------------------------------------------------

# Handle non-NixOS installs.
if [ -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]; then
    # Multi-user (i.e. daemon) setups.
    # Normally /etc/profile.d/nix.sh sources this, but that only applies to
    # login shells, so we'll go ahead and source that here.
    . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
elif [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
    # Single-user installs.
    . $HOME/.nix-profile/etc/profile.d/nix.sh
fi

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

# put ~/bin on PATH if you have it
test -d "$HOME/bin" &&
PATH="$HOME/bin:$PATH"

# Try to determine color support
# http://vim.wikia.com/wiki/256_colors_in_vim
if [ "$TERM" = "xterm" ] ; then
    if [ -z "$COLORTERM" ] ; then
        if [ -z "$XTERM_VERSION" ] ; then
            echo "Warning: Terminal wrongly calling itself 'xterm'."
        else
            case "$XTERM_VERSION" in
            "XTerm(256)") TERM="xterm-256color" ;;
            "XTerm(88)") TERM="xterm-88color" ;;
            "XTerm") ;;
            *)
                echo "Warning: Unrecognized XTERM_VERSION: $XTERM_VERSION"
                ;;
            esac
        fi
    else
        case "$COLORTERM" in
            gnome-terminal)
                # Those crafty Gnome folks require you to check
                # COLORTERM,
                # but don't allow you to just *favor* the setting over
                # TERM.
                # Instead you need to compare it and perform some
                # guesses
                # based upon the value. This is, perhaps, too
                # simplistic.
                TERM="gnome-256color"
                ;;
            *)
                echo "Warning: Unrecognized COLORTERM: $COLORTERM"
                ;;
        esac
    fi
fi

SCREEN_COLORS="`tput colors`"
if [ -z "$SCREEN_COLORS" ] ; then
    case "$TERM" in
        screen-*color-bce)
            echo "Unknown terminal $TERM. Falling back to 'screen-bce'."
            export TERM=screen-bce
            ;;
        *-88color)
            echo "Unknown terminal $TERM. Falling back to 'xterm-88color'."
            export TERM=xterm-88color
            ;;
        *-256color)
            echo "Unknown terminal $TERM. Falling back to 'xterm-256color'."
            export TERM=xterm-256color
            ;;
    esac
    SCREEN_COLORS=`tput colors`
fi
if [ -z "$SCREEN_COLORS" ] ; then
    case "$TERM" in
        gnome*|xterm*|konsole*|aterm|[Ee]term)
            echo "Unknown terminal $TERM. Falling back to 'xterm'."
            export TERM=xterm
            ;;
        rxvt*)
            echo "Unknown terminal $TERM. Falling back to 'rxvt'."
            export TERM=rxvt
            ;;
        screen*)
            echo "Unknown terminal $TERM. Falling back to 'screen'."
            export TERM=screen
            ;;
    esac
    SCREEN_COLORS=`tput colors`
fi

# ----------------------------------------------------------------------
# ENVIRONMENT CONFIGURATION
# ----------------------------------------------------------------------

# detect interactive shell
case "$-" in
    *i*) INTERACTIVE=yes ;;
    *)   unset INTERACTIVE ;;
esac

# detect login shell
case "$0" in
    -*) LOGIN=yes ;;
    *)  unset LOGIN ;;
esac

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
HISTCONTROL=ignoreboth
HISTFILESIZE=10000
HISTSIZE=10000

# ----------------------------------------------------------------------
# PAGER / EDITOR
# ----------------------------------------------------------------------

# See what we have to work with ...
HAVE_VIM=$(command -v vim)
HAVE_GVIM=$(command -v gvim)

# EDITOR
test -n "$HAVE_VIM" &&
EDITOR=vim ||
EDITOR=vi
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

prompt_color() {
    VCPROMPT=""
    if test -n "$(command -v vcprompt)"; then
        VCPROMPT=" \$(vcprompt)"
    fi

    PS1="\n\[$EGREEN\]\u\[$EWHITE\]@\[$EGREEN\]\h\[$NO_COLOR\]:\[$EBLUE\]\w\[$EBLACK\]$VCPROMPT\[$ERED\]\$(_jobscount)\[$NO_COLOR\] \n\[$ERED\]→ \[$NO_COLOR\]"
    PS2="\[$ERED\]> \[$NO_COLOR\]"
}

# ----------------------------------------------------------------------
# MACOS X / DARWIN SPECIFIC
# ----------------------------------------------------------------------

if [ "$UNAME" = Darwin ]; then
    # put ports on the paths if /opt/local exists
    test -x /opt/local -a ! -L /opt/local && {
        PORTS=/opt/local

        # setup the PATH and MANPATH
        PATH="$PORTS/bin:$PORTS/sbin:$PATH"
        MANPATH="$PORTS/share/man:$MANPATH"

        # nice little port alias
        alias port="sudo nice -n +18 $PORTS/bin/port"
    }

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

# ----------------------------------------------------------------------
# BASH COMPLETION
# ----------------------------------------------------------------------

test -z "$BASH_COMPLETION" && {
    bash=${BASH_VERSION%.*}; bmajor=${bash%.*}; bminor=${bash#*.}
    test -n "$PS1" && test $bmajor -gt 1 && {
        # search for a bash_completion file to source
        for f in /usr/local/etc/bash_completion \
                 /usr/pkg/etc/bash_completion \
                 /opt/local/etc/bash_completion \
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

# --------------------------------------------------------------------
# MISC COMMANDS
# --------------------------------------------------------------------

# push SSH public key to another box
push_ssh_cert() {
    local _host
    test -f ~/.ssh/id_dsa.pub || ssh-keygen -t dsa
    for _host in "$@";
    do
        echo $_host
        ssh $_host 'cat >> ~/.ssh/authorized_keys' < ~/.ssh/id_dsa.pub
    done
}

# --------------------------------------------------------------------
# PATH MANIPULATION FUNCTIONS
# --------------------------------------------------------------------

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

# -------------------------------------------------------------------
# USER SHELL ENVIRONMENT
# -------------------------------------------------------------------

# source ~/.shenv now if it exists
test -r ~/.shenv &&
. ~/.shenv

# condense PATH entries
PATH=$(puniq $PATH)
MANPATH=$(puniq $MANPATH)

# Use the color prompt by default when interactive
test -n "$PS1" &&
prompt_color

# -------------------------------------------------------------------
# RUBY
# -------------------------------------------------------------------

# http://www.engineyard.com/blog/2011/tuning-the-garbage-collector-with-ruby-1-9-2/
# http://www.engineyard.com/blog/2010/mri-memory-allocation-a-primer-for-developers/
# http://www.viddler.com/v/87ae120a

ruby_gc_default () {
    export RUBY_HEAP_MIN_SLOTS           = 10000
    export RUBY_HEAP_SLOTS_INCREMENT     = 10000
    export RUBY_HEAP_SLOTS_GROWTH_FACTOR = 1.8
    export RUBY_GC_MALLOC_LIMIT          = 8000000
    export RUBY_HEAP_FREE_MIN            = 4096
}

ruby_gc_tuned () {
    export RUBY_HEAP_MIN_SLOTS           = 1250000
    export RUBY_HEAP_SLOTS_INCREMENT     = 100000
    export RUBY_HEAP_SLOTS_GROWTH_FACTOR = 1
    export RUBY_GC_MALLOC_LIMIT          = 30000000
    export RUBY_HEAP_FREE_MIN            = 12500
}


# ----------------------------------------------------------------------
#  Local Settings
# ----------------------------------------------------------------------

if [[ -s ~/.bash/local.sh ]] ; then
    source ~/.bash/local.sh
fi

# -------------------------------------------------------------------
# MOTD / FORTUNE
# -------------------------------------------------------------------

test -n "$INTERACTIVE" -a -n "$LOGIN" && {
    uname -npsr
    uptime
}
