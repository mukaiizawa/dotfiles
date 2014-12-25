
function! EOLType()
  if &fileformat == 'unix'
    return 'LF'
  elseif &fileformat == 'dos'
    return 'CRLF'
  else
    return 'CR'
  endif
endfunction

