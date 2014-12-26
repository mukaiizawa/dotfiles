" for statusline
function! CurrentFileformat()
  if &fileformat == 'unix'
    return 'LF'
  elseif &fileformat == 'dos'
    return 'CRLF'
  else
    return 'CR'
  endif
endfunction

function! CurrentLine()
  let s:numOfDigit = strlen(line('$'))
  return FillWhiteSpace(line('.'), s:numOfDigit) .
        \  '/' . FillWhiteSpace(line('$'), s:numOfDigit)
endfunction

function! CurrentCol()
  let s:numOfDigit = 3    " hard cording
  return FillWhiteSpace(col('.'), s:numOfDigit) .
        \  '/' . FillWhiteSpace(col('$'), s:numOfDigit)
endfunction
