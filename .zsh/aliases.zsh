# Misc.

alias mate="nocorrect mate"
alias cpwd="pwd | ruby -pe'\$_.chomp!' | pbcopy" # copy path to clipboard
alias preview='open -a Preview'
alias dtfiles="sudo dtrace -n 'syscall::open*:entry { printf(\"%s %s\", execname, copyinstr(arg0)); }'"
alias ffprof="/Applications/Firefox.app/Contents/MacOS/firefox -profilemanager"

# Rails

alias be='bundle exec'
alias rs='bundle exec rails s'
alias rc='bundle exec rails c'
alias rg='bundle exec rails g'
alias sc='./script/console'

# Rack

alias ru='bundle exec rackup config.ru'

# Git

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

# undo OMZ's annoying safe delete alias
alias rm='nocorrect rm'

# fasd
alias a='fasd -a'    # any
alias s='fasd -s'    # show / search / select
alias d='fasd -d'    # directory
alias f='fasd -f'    # file
alias z='fasd_cd -d' # cd, same functionality as j in autojump
alias v='f -e vim'   # quick opening files with vim

# steam
alias cdsteam='cd ~/Library/Application\ Support/Steam/SteamApps/'

# Python
alias ipyqt='ipython qtconsole --pylab=inline < /dev/null &>/dev/null & disown'

# chruby
alias chruby-rehash='RUBIES=("$HOME"/.rubies/*)'

# Chef
alias chef-gem="/opt/chef/embedded/bin/gem"

# RPi
alias rpicom='minicom -b 115200 -o -D /dev/cu.PL2303-007212FD'
# alias rpicom='picocom -b 115200 /dev/cu.PL2303-007212FD'

# Haskell
alias ghci="ghci -v0"

# NOCORRECT
alias figlet='nocorrect figlet'
alias mplayer='nocorrect mplayer'
alias gradle='nocorrect gradle'
alias node='nocorrect node'
