" Author: Charles Strahan
" 
" TODO: make this better
function! url#OpenUrlUnderCursor()
  let cmd="open"
  let url = matchstr(getline("."), '\(https\?:\/\/\|www.\)[^ >,;]*')
  if url != ""
    silent exec "!".cmd." ".shellescape(url, 1) | redraw! 
  else
    echo "No URL under cursor."
  endif
endfunction
