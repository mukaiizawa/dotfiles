
function! Insert(str)
  let s:lineStr = getline('.')
  let s:leftPart = s:lineStr[: col('.') - 1 ]
  let s:rightPart = s:lineStr[col('.') : ]
  let s:result = s:leftPart . a:str . s:rightPart
  call setline(line('.'), s:result)
endfunction

function! InsertDate()
  call Insert(strftime("%Y-%m-%d"))
endfunction

command! InsertDate call InsertDate()
