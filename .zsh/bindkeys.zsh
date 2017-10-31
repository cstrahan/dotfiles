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

function _browse-with-ranger() {
  local space=""
  local file
  local outfile=$(mktemp "${TMPDIR:-/var/tmp}"/ranger-chosen-file.XXXX)

  ranger --choosefiles="${outfile}" --cmd 'map <enter> open_with 0' </dev/tty

  if [[ -e "${outfile}" ]]; then
    while IFS='' read -r file || [[ -n "${line}" ]]; do
      # use either a relative path or fullpath, whichever is shorter.
      local abs="${file}"
      local rel=$(realpath --no-symlinks --relative-to="${PWD}" "${abs}")
      if [[ "${#abs}" -gt "${#rel}" ]]; then
        file="${rel}"
      else
        file="${abs}"
      fi

      LBUFFER="${LBUFFER}${space}${(q)file}"
      space=" "
    done < "${outfile}"
  fi

  rm -f ${outfile}
  zle reset-prompt
}

zle -N _browse-with-ranger

# Choose file with Ranger
bindkey '^o' _browse-with-ranger 
