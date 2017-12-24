function! FillWhiteSpace(argStr, targetLength)
  let s:returnStr = a:argStr
  while strlen(s:returnStr) < a:targetLength
    let s:returnStr = ' ' . s:returnStr
  endwhile
  return s:returnStr
endfunction

function! PrintError(msg)
  echohl Error | echomsg a:msg | echohl None
endfunction

function ToggleShiftWidth()
  if &shiftwidth == 2
    setl shiftwidth=4
  else
    setl shiftwidth=2
  endif
endfunction
