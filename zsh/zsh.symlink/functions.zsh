function internet\? {
  (ping -c 3 -t 3 google.com >/dev/null 2>&1 && echo 'yep') || echo 'nope'
}

# cabal-sandbox aware ghc wrapper
function ghcs {
  local DIR=$PWD
  local TARGET="cabal.sandbox.config"
  while [ ! -e $DIR/$TARGET -a $DIR != "/" ]; do
    DIR=$(dirname $DIR)
  done
  if test $DIR != "/"; then
    local DB=$(sed -ne '/^package-db: */{s///p;q;}' "$DIR/$TARGET")
    ghc -no-user-package-db -package-db="$DB" "$@"
  else
    ghc "$@"
  fi
}

function ghcis {
  local DIR=$PWD
  local TARGET="cabal.sandbox.config"
  while [ ! -e $DIR/$TARGET -a $DIR != "/" ]; do
    DIR=$(dirname $DIR)
  done
  if test $DIR != "/"; then
    local DB=$(sed -ne '/^package-db: */{s///p;q;}' "$DIR/$TARGET")
    ghci -no-user-package-db -package-db="$DB" "$@"
  else
    ghci "$@"
  fi
}

# Types text from stdin into the last active window
function sendkeys {
  # Switch to previously active app
  local script="
    tell application \"System Events\"
      tell process \"finder\"
        activate
        keystroke tab using {command down}
      end tell
    end tell
    delay 0.1
    "
  echo "$script" | osascript

  # Send the keys
  ruby -e "
    begin; require 'rubygems'; rescue ImportError; end
    require 'appscript'
    include Appscript
    ARGF.each_line do |line|
      app('System Events').keystroke(line)
      app('System Events').key_code(36)
    end
  "
}

# credit: http://nparikh.org/notes/zshrc.txt
# Usage: smartextract <file>
# Description: extracts archived files / mounts disk images
# Note: .dmg/hdiutil is Mac OS X-specific.
function smartextract {
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz2)  tar -jxvf $1                        ;;
      *.tar.gz)   tar -zxvf $1                        ;;
      *.bz2)      bunzip2 $1                          ;;
      *.dmg)      hdiutil mount $1                    ;;
      *.gz)       gunzip $1                           ;;
      *.tar)      tar -xvf $1                         ;;
      *.tbz2)     tar -jxvf $1                        ;;
      *.tgz)      tar -zxvf $1                        ;;
      *.zip)      unzip $1                            ;;
      *.ZIP)      unzip $1                            ;;
      *.pax)      cat $1 | pax -r                     ;;
      *.pax.Z)    uncompress $1 --stdout | pax -r     ;;
      *.Z)        uncompress $1                       ;;
      *)          echo "'$1' cannot be extracted/mounted via smartextract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

function smartcompress { # compress a file or folder
  case "$1" in
    tar.bz2|.tar.bz2) tar cvjf "${2%%/}.tar.bz2" "${2%%/}/"  ;;
    tbz2|.tbz2)       tar cvjf "${2%%/}.tbz2" "${2%%/}/"     ;;
    tbz|.tbz)         tar cvjf "${2%%/}.tbz" "${2%%/}/"      ;;
    tar.gz|.tar.gz)   tar cvzf "${2%%/}.tar.gz" "${2%%/}/"   ;;
    tgz|.tgz)         tar cvjf "${2%%/}.tgz" "${2%%/}/"      ;;
    tar|.tar)         tar cvf  "${2%%/}.tar" "${2%%/}/"      ;;
    rar|.rar)         rar a "${2}.rar" "$2"                  ;;
    zip|.zip)         zip -9 "${2}.zip" "$2"                 ;;
    7z|.7z)           7z a "${2}.7z" "$2"                    ;;
    lzo|.lzo)         lzop -v "$2"                           ;;
    gz|.gz)           gzip -v "$2"                           ;;
    bz2|.bz2)         bzip2 -v "$2"                          ;;
    xz|.xz)           xz -v "$2"                             ;;
    lzma|.lzma)       lzma -v "$2"                           ;;
    *)  echo "smartcompress(): compress a file or directory."
        echo "Usage:   ac <archive type> <filename>"
        echo "Example: ac tar.bz2 PKGBUILD"
        echo "Please specify archive type and source."
        echo "Valid archive types are:"
        echo "tar.bz2, tar.gz, tar, bz2, gz, tbz2, tbz,"
        echo "tgz, lzo, rar, zip, 7z, xz and lzma."          ;;
  esac
}

# http://xanana.ucsc.edu/xtal/iterm_tab_customization.html
# make finder cd to pwd or arg
function cdf {
  if [ -n "$1" ]; then
    if [ "${1%%/*}" = "" ]; then
      local thePath="$1"
    else
      local thePath=`pwd`"/$1"
    fi
  else
    local thePath=`pwd`
  fi

  osascript &> /dev/null <<END
  set myPath to ( POSIX file "$thePath" as alias )
  try
    tell application "Finder" to set the (folder of the front window) to myPath
  on error -- no open folder windows
    tell application "Finder" to open myPath
  end try
END
}

# cd to current finder folder
function fcd {
  local currFolderPath=$( /usr/bin/osascript <<EOT
      tell application "Finder"
          try
              set currFolder to (folder of the front window as alias)
          on error
              set currFolder to (path to desktop folder as alias)
          end try
          POSIX path of currFolder
      end tell
EOT
  )
  cd "$currFolderPath"
}

function rcd {
  tempfile=/tmp/chosendir
  command ranger --choosedir=$tempfile "$@"
  if [ -f $tempfile -a "$(cat $tempfile)" != "$(pwd | tr -d "\n")" ]
  then
    cd "$(cat $tempfile)"
    rm $tempfile
  fi
}

# By @ieure; copied from https://gist.github.com/1474072
#
# It finds a file, looking up through parent directories until it finds one.
# Use it like this:
#
#   $ ls .tmux.conf
#   ls: .tmux.conf: No such file or directory
#
#   $ ls `up .tmux.conf`
#   /Users/grb/.tmux.conf
#
#   $ cat `up .tmux.conf`
#   set -g default-terminal "screen-256color"
#
function up {
  if [ "$1" != "" -a "$2" != "" ]; then
    local DIR=$1
    local TARGET=$2
  elif [ "$1" ]; then
    local DIR=$PWD
    local TARGET=$1
  fi
  while [ ! -e $DIR/$TARGET -a $DIR != "/" ]; do
    DIR=$(dirname $DIR)
  done
  test $DIR != "/" && echo $DIR/$TARGET
}

# Because:
#  1. I'm forgetful.
#  2. I'm lazy.
function rake {
  if [ -f Gemfile ]; then
    if [ -S .zeus.sock ]; then
      zeus rake "$@"
    else
      bundle exec rake "$@"
    fi
  else
    command rake "$@"
  fi
}

# TODO: Create funcs for rails {runner,server,generate,console} that redirect to zeus

function guard {
  if [ -f Gemfile ]; then
    bundle exec guard "$@"
  else
    command guard "$@"
  fi
}

function gcim {
  git commit -m "$*"
}

# delete's local/remote branches that are already merged.
function grmb {
  current_branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
  if [ "$current_branch" != "master" ]; then
    echo "WARNING: You are on branch $current_branch, NOT master."
  fi
  echo "Fetching merged branches..."
  git remote prune origin
  remote_branches=$(git branch -r --merged | grep -v '/master$' | grep -v "/$current_branch$")
  local_branches=$(git branch --merged | grep -v 'master$' | grep -v "$current_branch$")
  if [ -z "$remote_branches" ] && [ -z "$local_branches" ]; then
    echo "No existing branches have been merged into $current_branch."
  else
    echo "This will remove the following branches:"
    if [ -n "$remote_branches" ]; then
      echo "$remote_branches"
    fi
    if [ -n "$local_branches" ]; then
      echo "$local_branches"
    fi
    printf "Continue? (y/n): "
    read -k 1 choice
    echo
    if [[ "$choice" == "y" ]] || [[ "$choice" == "Y" ]]; then
      # Remove remote branches
      git push origin `git branch -r --merged | grep -v '/master$' | grep -v "/$current_branch$" | sed 's/origin\//:/g' | tr -d '\n'`
      # Remove local branches
      git branch -d `git branch --merged | grep -v 'master$' | grep -v "$current_branch$" | sed 's/origin\///g' | tr -d '\n'`
    else
      echo "No branches removed."
    fi
  fi
}

# creates tracking branches for each remote branch on origin
function gfb {
  local orig_branch=`git rev-parse --abbrev-ref HEAD`
  git fetch >/dev/null 2>&1
  git ls-remote origin |\
    awk '/refs\/heads\/'$branch'/ {print $2}' |\
    grep -v "/refs/heads/" |\
    while read line; do
      local remote_branch=`echo $line | sed -n 's/^refs\/heads\///p'`

      git show-ref --verify --quiet refs/heads/$remote_branch
      if [[ ! $? -eq 0 ]] ; then
        echo "Creating remote branch $remote_branch"
        git checkout --track origin/$remote_branch >/dev/null 2>&1
      fi
    done
  git checkout $orig_branch >/dev/null 2>&1
}

function cdgem {
  cd `gem env gemdir`/gems/; cd `ls|grep $1|sort|tail -1`
}

# prints full "Back to My Mac" url for this user and machine
function btmm {
  echo -ne "$(whoami)"@
  echo -ne ${$(hostname | sed -n 's/\(.*\)\.local$/\1/p' )%\n}.
  echo show Setup:/Network/BackToMyMac | scutil | sed -n 's/.* : *\(.*\).$/\1/p'
}
