" for statusline
function! EOLType()
  if &fileformat == 'unix'
    return 'LF'
  elseif &fileformat == 'dos'
    return 'CRLF'
  else
    return 'CR'
  endif
endfunction

function! CurrentLocation()
  let s:currentCol = FillWhiteSpace(col('.'), 3)
  let s:currentLine = FillWhiteSpace(line('.'), 6)
  let s:returnStr = s:currentLine. ',' . s:currentCol 
  return s:returnStr
endfunction

