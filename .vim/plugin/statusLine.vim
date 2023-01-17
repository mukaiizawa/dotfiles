" statusLine.vim

fu! CurrentFileformat()
  if &fileformat == 'unix'
    retu 'LF'
  elsei &fileformat == 'dos'
    retu 'CRLF'
  el
    retu 'CR'
  en
endf

fu! CurrentLine()
  let s:numOfDigit = strlen(line('$'))
  retu FillWhiteSpace(line('.'), s:numOfDigit) .
        \  '/' . FillWhiteSpace(line('$'), s:numOfDigit)
endf

fu! CurrentCol()
  let s:numOfDigit = 3    " hard cording
  retu FillWhiteSpace(col('.'), s:numOfDigit) .
        \  '/' . FillWhiteSpace(col('$') - 1, s:numOfDigit)
endf
