# grep
alias grep="grep --color=auto"

# misc.
alias dtfiles="sudo dtrace -n 'syscall::open*:entry { printf(\"%s %s\", execname, copyinstr(arg0)); }'"
alias ffprof="/Applications/Firefox.app/Contents/MacOS/firefox -profilemanager"

# git
alias rebase='git fetch; git rebase origin/master'
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

alias less='command less -R'

# steam
alias cdsteam='cd ~/Library/Application\ Support/Steam/SteamApps/'

# Python
alias ipyqt='ipython qtconsole --pylab=inline < /dev/null &>/dev/null & disown'

# chruby
alias chruby-rehash='RUBIES=("$HOME"/.rubies/*)'

# Haskell
alias ghci="ghci -v0"
