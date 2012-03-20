# credit: http://nparikh.org/notes/zshrc.txt
# Usage: smartextract <file>
# Description: extracts archived files / mounts disk images
# Note: .dmg/hdiutil is Mac OS X-specific.
function smartextract () {
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

# http://xanana.ucsc.edu/xtal/iterm_tab_customization.html
# make finder cd to pwd or arg
function fcd {
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
cdf ()
{
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
