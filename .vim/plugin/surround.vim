
function! SurroundWith(leftPart, rightPart)

  " Move the first non-blank character of the line.
  execute ':normal ^'
  let s:targetString = getline('.')[col('.') - 1 : ]    " Removed blanc of current line.
  let s:substIndex = stridx(s:targetString, a:leftPart)


  if s:substIndex == 0    " Is it surrounded already?

    " Remove leftPart from targetString.
    let s:targetString = s:targetString[strlen(a:leftPart) : ]
    let s:copyOfTargetString = s:targetString

    " Get substIndex of rightPart.
    while s:substIndex != -1
      let s:copyOfTargetString = s:copyOfTargetString[s:substIndex + 1: ]
      let s:substIndex = stridx(s:copyOfTargetString, a:rightPart)
    endwhile

    " Remove rightPart from targetString.
    let s:outputLine = s:targetString[ : s:substIndex - strlen(a:rightPart)]

  else
    " Surround print string!
    let s:outputLine = a:leftPart . s:targetString . a:rightPart

  endif

  " write and indent
  call setline('.', s:outputLine)
  execute ':normal == '

endfunction

" command! PrintSurround call PrintSurround()

