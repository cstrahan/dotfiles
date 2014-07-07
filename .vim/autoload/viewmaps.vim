" Author: Charles Strahan
"
" Show maps (and where they came from)
"
" TODO: clean this up

if exists('loaded_viewmaps') || &cp
  finish
endif
let loaded_viewmaps=1

let s:BufferName = "__Maps__"

function! s:OpenBuffer()
  let scr_bufnum = bufnr(s:BufferName)
  if scr_bufnum == -1
    exe "new " . s:BufferName
  else
    let scr_winnum = bufwinnr(scr_bufnum)
    if scr_winnum != -1
      if winnr() != scr_winnum
        exe scr_winnum . "wincmd w"
      endif
    else
      exe "split +buffer" . scr_bufnum
    endif
  endif
endfunction

function! s:MarkBuffer()
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
  setlocal buflisted
endfunction

function! viewmaps#Show()
  redir @"
  silent map 
  silent map!
  redir END
  call s:OpenBuffer()
  put
  call s:MarkBuffer()
  g/^$/d
  normal gg
endfunction

function! viewmaps#ShowVerbose()
  redir @"
  silent verbose map 
  silent verbose map!
  redir END
  call s:OpenBuffer()
  put
  call s:MarkBuffer()
  g/^$/d
  normal gg
endfunction
