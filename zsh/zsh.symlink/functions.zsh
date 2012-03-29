function internet\? {
  (ping -c 3 -t 3 google.com >/dev/null 2>&1 && echo 'yep') || echo 'nope'
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
