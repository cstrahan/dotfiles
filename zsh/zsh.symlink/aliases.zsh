# Misc.

alias ll='ls -lF' # long format listing; add / to end of directories
alias la='ls -alF' # include dot files in listing; add / to end of directories
alias cpwd="pwd | ruby -pe'\$_.chomp!' | pbcopy" # copy path to clipboard
alias preview='open -a Preview'

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
alias g='git'
alias gpom='git push origin master'
alias gitx='gitx --all'
alias gst='git status'
alias gc='git commit'
alias gd='git diff'
alias gdc='git diff --cached'
alias go='git co'
alias getch='git fetch'
