booktime () {
  local dir="$1"
  if [[ -z "$dir" ]]; then
    dir="."
  fi
  local book="$(find "$dir" -name "*.pdf" | peco)"
  if [[ -n "$book" ]]; then
    zathura "$book" 2>/dev/null &!
  fi
}

# cabal-sandbox aware wrapper
sandy () {
  local DIR="$PWD"
  local TARGET="cabal.sandbox.config"
  local PROG="$1"
  shift
  while [ ! -e "$DIR/$TARGET" -a "$DIR" != "/" ]; do
    DIR="$(dirname $DIR)"
  done
  if test "$DIR" != "/"; then
    local DB="$(sed -ne '/^package-db: */{s///p;q;}' "$DIR/$TARGET")"
    "$PROG" -no-user-package-db -package-db="$DB" "$@"
  else
    "$PROG" "$@"
  fi
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
      *.tar.xz)   xz -d < $1 | tar xf    -            ;;
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

# cd via ranger
function rcd {
  local tempfile=/tmp/chosendir
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

function cdgem {
  cd `gem env gemdir`/gems/; cd `ls|grep $1|sort|tail -1`
}
