# TODO: https://github.com/romkatv/gitstatus

# completions
fpath+=~/.zfunc

# macOS path setup
if [[ ${OSTYPE} == darwin* ]]; then
  # inline the results of: /usr/local/bin/brew shellenv
  export HOMEBREW_PREFIX="/usr/local";
  export HOMEBREW_CELLAR="/usr/local/Cellar";
  export HOMEBREW_REPOSITORY="/usr/local/Homebrew";
  export PATH="/usr/local/bin:/usr/local/sbin${PATH+:$PATH}";
  export MANPATH="/usr/local/share/man${MANPATH+:$MANPATH}:";
  export INFOPATH="/usr/local/share/info:${INFOPATH:-}";

  # wezterm and wezterm-gui
  PATH=/Applications/WezTerm.app/Contents/MacOS:$PATH

  # provide GNU man pages for e.g. ls
  #export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}"

  # provide GNU man pages for e.g. gls
  export MANPATH="/usr/local/opt/coreutils/share/man/:${MANPATH}"
fi

# rtx path
PATH=$HOME/.local/share/rtx/bin:$PATH

# go install stuff
PATH=$HOME/go/bin:$PATH

# local binaries
PATH=$HOME/.local/bin:$PATH

# rustup
if [[ -e "$HOME/.cargo/env" ]]; then
  . "$HOME/.cargo/env"
fi

# editor
if (( $+commands[lvim] )); then
  export EDITOR=lvim
  alias vi=lvim
elif (( $+commands[nvim] )); then
  export EDITOR=nvim
  alias vi=nvim
elif (( $+commands[vim] )); then
  export EDITOR=vim
  alias vi=vim
fi
if [[ -n "$EDITOR" ]]; then
  VISUAL=$EDITOR
fi

# show all the history stored.
#alias history="fc -l 1"

# stop using ag
if (( $+commands[rg] )); then
  alias ag=rg
fi

# LS_COLORS
local dircolors_cmd
if (( $+commands[dircolors] )); then
  dircolors_cmd=dircolors
elif (( $+commands[gdircolors] )); then
  # for macOS: brew install coreutils
  dircolors_cmd=gdircolors
fi
test -n "$dircolors_cmd" && {
  local COLORS
  # interesting:
  #   https://github.com/trapd00r/LS_COLORS
  #   https://github.com/sharkdp/vivid
  if [[ -e "$HOME/.dircolors" ]]; then
    COLORS="$HOME/.dircolors"
  fi
  eval `${dircolors_cmd} --sh $COLORS`
}
unset dircolors_cmd

# use ls with LS_COLORS support
if [[ ${OSTYPE} == darwin* ]]; then
  # BSD (and macOS) has a different format for LS_COLORS,
  # and the environment variable is LSCOLORS instead.
  # See: https://github.com/lucas-flowers/gnu2bsd
  if (( $+commands[gls] )); then
    # use GNU ls
    # this lets us use LS_COLORS as we would on Linux
    alias ls="command gls -hBG --color=auto"
  #elif [ -d /usr/local/opt/coreutils/bin ]; then
  #  # use GNU ls
  #  # this lets us use LS_COLORS as we would on Linux
  #  alias ls="/usr/local/opt/coreutils/bin/gls -hBG --color=auto"
  else
    # default to macOS's BSD ls
    alias ls="command ls -hBG"
  fi

  # mouse support, if we have less from homebrew
  if [[ $commands[less] = /usr/local/bin/less ]]; then
    export LESS="--mouse"
    export PAGER="/usr/local/bin/less"
    export DELTA_PAGER="$PAGER"
    export MANPAGER="$PAGER"
  fi
else
  # presume Linux
  alias ls="command ls -hBG --color=auto"
fi

# load fzf
if [[ -f ~/.fzf.zsh ]]; then
  source ~/.fzf.zsh
fi

# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# Remove # from WORDCHARS
WORDCHARS=${WORDCHARS//[#]}

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
#zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
# if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
#   source ${ZIM_HOME}/zimfw.zsh init -q
# fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
# }}} End configuration added by Zim install

# make man colorful (overriding the defaults from Zim)
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# warn if I have background jobs
setopt CHECK_JOBS

# send SIGHUP to jobs on shell exit
setopt HUP

# wezterm
# we'll let the termtitle zmodule handle this
WEZTERM_SHELL_SKIP_CWD=1
# if wezterm integration wasn't loaded through /etc/{zshenv,zprofile,zshrc}
if ! (( $+functions[__wezterm_user_vars_precmd])); then
  if [[ ${OSTYPE} == darwin* ]]; then
    if [[ -e /Applications/WezTerm.app/Contents/Resources/wezterm.sh ]]; then
      . /Applications/WezTerm.app/Contents/Resources/wezterm.sh
    fi
  fi
fi


# fzf-tab settings
#
# fix https://github.com/Aloxaf/fzf-tab/issues/24
zstyle -d ':completion:*' format
zstyle ':completion:*:descriptions' format '[%d]'
#zstyle ':completion:*:descriptions' format '-- %d --'
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content when completing cd
if (( $+commands[lsd] )); then
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd --color=always --icon=always $realpath'
elif (( $+commands[exa] )); then
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
elif [[ -x /usr/local/bin/gls ]]; then
  zstyle ':fzf-tab:complete:cd:*' fzf-preview '/usr/local/bin/gls --color=always $realpath'
elif command ls --version >/dev/null 2>&1; then
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color=always $realpath'
else
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls $realpath'
fi

# key bindings to switch to previous and next group
zstyle ':fzf-tab:*' switch-group '<' '>'

# Change working dir in shell to last dir in lf on exit (adapted from ranger).
lfcd () {
    local tmp="$(mktemp)"
    # `command` is needed in case `lfcd` is aliased to `lf`
    command lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        local dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}
bindkey -s '^o' 'lfcd\n'

if (( $+commands[bat] )); then
  # use bat for full screen preview in lf
  alias lf='BAT_PAGER=$PAGER PAGER=bat command lf'
fi

# This script was automatically generated by the broot program
# More information can be found in https://github.com/Canop/broot
# This function starts broot and executes the command
# it produces, if any.
# It's needed because some shell commands, like `cd`,
# have no useful effect if executed in a subshell.
function br {
    local cmd cmd_file code
    cmd_file=$(mktemp)
    if broot --outcmd "$cmd_file" "$@"; then
        cmd=$(<"$cmd_file")
        command rm -f "$cmd_file"
        eval "$cmd"
    else
        code=$?
        command rm -f "$cmd_file"
        return "$code"
    fi
}

# https://dystroy.org/blog/gg/
# git diff before commit
function gg {
    broot --conf ~/.config/broot/git-diff-conf.toml --git-status
}

# kill selected processes
kp() {
  # SIGTERM=15
  # SIGKILL=9
  local pid=$(ps -ef | sed 1d | eval "fzf ${=FZF_DEFAULT_OPTS} -m --header='[kill:process]'" | awk '{print $2}')
  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill ${@}
  fi
}

# https://sidneyliebrand.medium.com/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861
# https://sidneyliebrand.medium.com/combining-caniuse-with-fzf-fb93ad235bae

# fd is used by default, but I can use bfs like so:
# https://github.com/tavianator/bfs/discussions/119
#export FZF_CTRL_T_COMMAND="bfs -color -mindepth 1 -nohidden -printf '%P\n' 2>/dev/null"
#export FZF_ALT_C_COMMAND="bfs -color -mindepth 1 -nohidden -type d -printf '%P\n' 2>/dev/null"
export FZF_DEFAULT_OPTS='-x --ansi'
export FZF_CTRL_T_COMMAND="bfs -color -mindepth 1 -exclude \\( -name .git -or -name .hg \\) -printf '%P\n' 2>/dev/null"
export FZF_ALT_C_COMMAND="bfs -color -mindepth 1 -exclude \\( -name .git -or -name .hg \\) -type d -printf '%P\n' 2>/dev/null"
_fzf_compgen_path() {
    bfs -H "$1" -color -exclude \( -depth +0 -hidden \) 2>/dev/null
}
_fzf_compgen_dir() {
    bfs -H "$1" -color -exclude \( -depth +0 -hidden \) -type d 2>/dev/null
}

