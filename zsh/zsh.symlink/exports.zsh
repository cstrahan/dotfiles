export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH

export CDPATH=:~/projects
export RUBYOPT='rubygems -Itest'
export GIT_EDITOR="vim"
export EDITOR="vim"
export JAVA_HOME='/System/Library/Frameworks/JavaVM.framework/Home'

export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export ARCHFLAGS='-arch x86_64'

# make man colorful
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[1;31m'        # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;33;5;146m' # begin underline

# syntax highlight code with less
command -v src-hilite-lesspipe.sh >/dev/null 2>&1 &&
  export LESSOPEN="| src-hilite-lesspipe.sh %s"
