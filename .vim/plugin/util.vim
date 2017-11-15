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
