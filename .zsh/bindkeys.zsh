# Up/Down arrow for backword/forward history searching.
# Use [Ctrl]-R to initiate
# ([Ctr]-S should also work for forard searching in some terminals)
# http://www.techrepublic.com/blog/opensource/enhanced-history-searching-in-zsh/1347
#bindkey "^[[A" history-search-backward
#bindkey "^[[B" history-search-forward

# EMACS
#bindkey -e

# VIM
# Make backspace delete char in vi mode
#bindkey -v
#bindkey '^?' backward-delete-char

# MISC
# http://unix.stackexchange.com/questions/3283/zsh-to-auto-complete-directories-in-command-line-arguments
#bindkey '^X/' _bash_complete-word

# Make ctrl+u behave like bash. (normally bound to kill-whole-line)
bindkey \^U backward-kill-line

relpath () {
  # http://stackoverflow.com/a/14914070/48483
  [[ $# -ge 1 ]] && [[ $# -le 2 ]] || return 1
  local target=${${2:-$1}:a} # replace `:a' by `:A` to resolve symlinks
  local current=${${${2:+$1}:-$PWD}:a} # replace `:a' by `:A` to resolve symlinks
  local appendix=${target#/}
  local relative=''
  while appendix=${target#$current/}
    [[ $current != '/' ]] && [[ $appendix = $target ]]; do
    if [[ $current = $appendix ]]; then
      relative=${relative:-.}
      print ${relative#/}
      return 0
    fi
    current=${current%/*}
    relative="$relative${relative:+/}.."
  done
  relative+=${relative:+${appendix:+/}}${appendix#/}
  print $relative
}

function _shortest-path() {
  local abs rel abs_len rel_len
  abs="$1"
  rel=`relpath "$abs"`
  abs_len=`echo "$abs" | wc -c`
  rel_len=`echo "$rel" | wc -c`
  if [[ $abs_len -gt $rel_len ]]; then
    echo $rel
  else
    echo $abs
  fi
}

function _browse-with-ranger() {
  local space=""
  local file
  local outfile=$(mktemp "${TMPDIR:-/var/tmp}"/ranger-chosen-file.XXXX)

  exec </dev/tty

  ranger --choosefiles="${outfile}" --cmd 'map <enter> open_with 0'

  if [[ -e "$outfile" ]]; then
    while IFS='' read -r file || [[ -n "${line}" ]]; do
      # use either a relative path or fullpath, whichever is shorter.
      file=$(_shortest-path "${file}")

      LBUFFER="${LBUFFER}${space}${(q)file}"
      space=" "
    done < "$outfile"
  fi

  zle reset-prompt
}

zle -N _browse-with-ranger

# Choose file with Ranger
bindkey '^o' _browse-with-ranger 
