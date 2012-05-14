# Misc.

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
alias gp='git push origin HEAD'
alias gaa='git add --all'
alias gpom='git push origin master'
alias gst='git status -sb'
alias gci='git commit'
alias gcia='git commit --amend'
alias gco='git co'
alias gdi='git diff'
alias gdc='git diff --cached'
alias glg='git lg'
alias getch='git fetch'
alias gitx='gitx --all'

alias less='command less -R'
