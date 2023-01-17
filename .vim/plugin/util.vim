" common utils

fu! FillWhiteSpace(argStr, targetLength)
  let s:returnStr = a:argStr
  while strlen(s:returnStr) < a:targetLength
    let s:returnStr = ' ' . s:returnStr
  endw
  retu s:returnStr
endf

fu! PrintError(msg)
  echohl Error | echomsg a:msg | echohl None
endf
