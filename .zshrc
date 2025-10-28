# vim: set tabstop=2:softtabstop=2:shiftwidth=2:expandtab

# TODO: https://github.com/romkatv/gitstatus
# TDOO: https://egeek.me/2020/04/18/enabling-locate-on-osx/

# completions and other functions
fpath[1,0]=(~/.zfunc)
# automatically autoload any functions in ~/.zfunc
# the completion system already adds _* functions,
# but this lets me autoload others too.
autoload -Uz ~/.zfunc/*(:t)

#
# If we're being recorded by VHS:
#if [[ "vhs" == "$(ps -p $(ps -p $(ps -p $$ -o ppid=) -o ppid=) -o comm=)" ]] then
#  :
#fi

# raw control chars
export LESS="-r"

# show all the history stored.
#alias history="fc -l 1"

# editor
if (( $+commands[nvim] )); then
  export EDITOR=nvim
  alias vi=nvim
elif (( $+commands[vim] )); then
  export EDITOR=vim
  alias vi=vim
fi
if [[ -n "$EDITOR" ]]; then
  VISUAL=$EDITOR
fi

if [[ ${OSTYPE} == darwin* ]]; then
  # https://eternalstorms.at/yoink/mac
  alias yoink='open -a Yoink'

  # https://apple.stackexchange.com/questions/15318/how-to-use-terminal-to-copy-a-file-to-the-clipboard/15484#15484
  #function copy_file() {
  #  osascript -e"{'on run{a}','set the clipboard to posix file a',end}" "$(readlink -f -- "$1")"
  #}

  # use ls with LS_COLORS support
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
  if [[ $commands[less] = $HOMEBREW_PREFIX/bin/less ]]; then
    export LESS="$LESS --mouse"
    export PAGER="$HOMEBREW_PREFIX/bin/less"
    export DELTA_PAGER="$PAGER"
    export MANPAGER="$PAGER"
  fi
else
  # presume Linux
  alias ls="command ls -hBG --color=auto"
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

# Incremental completion via llm
ZUMMONER_SPELL=1

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
#zstyle ':zim:zmodule' use 'degit'

# Don't automatically upgrade zim itself.
zstyle ':zim' 'disable-version-check' 'true'


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

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[comment]="fg=006"

# For fast-syntax-highlighting, if the theme is changed,
# be sure to apply the overlay to re-set the comment color (if needed):
#
#   fast-theme -t XDG:overlay
typeset -A FAST_HIGHLIGHT_STYLES
FAST_HIGHLIGHT_STYLES[comment]='fg=006'

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
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
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
#for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
#for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
#for key ('k') bindkey -M vicmd ${key} history-substring-search-up
#for key ('j') bindkey -M vicmd ${key} history-substring-search-down
#unset key
# }}} End configuration added by Zim install


# warn if I have background jobs
setopt CHECK_JOBS

# send SIGHUP to jobs on shell exit
setopt HUP

# Override asciiship theme to add extra info
PS1='
%(2L.%B%F{yellow}(%L)%f%b .)%(!.%B%F{red}%n%f%b in .${SSH_TTY:+"%B%F{yellow}%n%f%b in "})${SSH_TTY:+"%B%F{green}%m%f%b in "}%B%F{cyan}%~%f%b${(e)git_info[prompt]}${VIRTUAL_ENV:+" via %B%F{yellow}${VIRTUAL_ENV:t}%f%b"}$( (( $+commands[kubectl] )) && printf "%s" " via %B%F{cyan}k8s:$(kubectl config view --minify -o jsonpath="{.current-context}:{..namespace}")%f%b" )${duration_info}
%B%(1j.%F{blue}*%f .)%(?.%F{green}.%F{red}%? )$(_prompt_asciiship_vimode)%f%b '

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
elif [[ -x "$HOMEBREW_PREFIX/bin/gls" ]]; then
  zstyle ':fzf-tab:complete:cd:*' fzf-preview "$HOMEBREW_PREFIX"'/bin/gls --color=always $realpath'
elif command ls --version >/dev/null 2>&1; then
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color=always $realpath'
else
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls $realpath'
fi

# key bindings to switch to previous and next group
zstyle ':fzf-tab:*' switch-group '<' '>'

# ensure fzf-tab is enabled
if (( ${+commands[fzf]} )); then
  enable-fzf-tab
else
  disable-fzf-tab
fi

if [ -f "$HOME/.fzf-git.sh" ]; then
  source "$HOME/.fzf-git.sh"
fi


# Change working dir in shell to last dir in lf on exit (adapted from ranger).
lfcd () {
  local dir="$(command lf -print-last-dir "$@")"
  if [ -d "$dir" ]; then
    if [ "$dir" != "$(pwd)" ]; then
      cd "$dir"
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

listening() {
    if [ $# -eq 0 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}

if [ -f "$HOME/.ghcup/env" ]; then
  source "$HOME/.ghcup/env" # ghcup-env
fi

# cd into directory with yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi


if [[ "$TERM" = "xterm-kitty" ]]; then
  alias ssh='kitten ssh'
fi

ghcp() { gh copilot "$@" }

# Renders specified file as git flavored markdown and opens preview in Safari.
# From: https://github.com/PostgreSqlStan/zdotdir/commits/main/functions/gfm
# Need to: gem install kramdown kramdown-parser-gfm
gfm () {
  local f=$(mktemp)
  kramdown -i GFM --smart_quotes='apos,apos,quot,quot' $1 >| $f
  mv $f ${f}.html
  open -a Safari ${f}.html
}

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r "${HOME}/.opam/opam-init/init.zsh" ]] || source "${HOME}/.opam/opam-init/init.zsh" > /dev/null 2> /dev/null

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# fzf binary can be installed via:
#
#   cd ~/.local
#   wget https://raw.githubusercontent.com/junegunn/fzf/refs/heads/master/install
#   bash ./install --bin
#   rm install
#   cd -
# 

# debug startup with: zsh -x -i -l -c true

# move my functions to the start of fpath
exclude=( ~/.zfunc )
fpath=("${(@)fpath:|exclude}")
fpath[1,0]=(~/.zfunc)
unset exclude

# END opam configuration

# Load order:
# +----------------+-----------+-----------+------+
# |                |Interactive|Interactive|Script|
# |                |login      |non-login  |      |
# +----------------+-----------+-----------+------+
# |/etc/zshenv     |    A      |    A      |  A   |
# +----------------+-----------+-----------+------+
# |~/.zshenv       |    B      |    B      |  B   |
# +----------------+-----------+-----------+------+
# |/etc/zprofile   |    C      |           |      |
# +----------------+-----------+-----------+------+
# |~/.zprofile     |    D      |           |      |
# +----------------+-----------+-----------+------+
# |/etc/zshrc      |    E      |    C      |      |
# +----------------+-----------+-----------+------+
# |~/.zshrc        |    F      |    D      |      |
# +----------------+-----------+-----------+------+
# |/etc/zlogin     |    G      |           |      |
# +----------------+-----------+-----------+------+
# |~/.zlogin       |    H      |           |      |
# +----------------+-----------+-----------+------+
# |                |           |           |      |
# +----------------+-----------+-----------+------+
# |                |           |           |      |
# +----------------+-----------+-----------+------+
# |~/.zlogout      |    I      |           |      |
# +----------------+-----------+-----------+------+
# |/etc/zlogout    |    J      |           |      |
# +----------------+-----------+-----------+------+
# Source: https://medium.com/@rajsek/zsh-bash-startup-files-loading-order-bashrc-zshrc-etc-e30045652f2e):
