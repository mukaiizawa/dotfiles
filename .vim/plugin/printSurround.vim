
function! PrintSurround()

  let s:keyOfPrintDic = &filetype
  let s:printDic = {
        \  'vim'       : ['echo "', '"'],
        \  'dosbatch'  : ['echo "', '"'],
        \  'c'         : ['printf("', '\n");'],
        \  'java'      : ['System.out.println("', '");'],
        \  'lisp'      : ['(print "', '")'],
        \
        \  }

  if has_key(s:printDic, s:keyOfPrintDic ) != 1    " Is this file type supported?
    echo "This file type isn't supported."
    return
  else

    " Move the first non-blank character of the line.
    execute ':normal ^'
    let s:targetString = getline('.')[col('.') - 1 : ]    " Removed blanc of current line.
    let s:leftPart = (s:printDic[s:keyOfPrintDic])[0]
    let s:rightPart = (s:printDic[s:keyOfPrintDic])[1]
    let s:substIndex = stridx(s:targetString, s:leftPart)


    if s:substIndex == 0    " Is it surrounded already?

    " Remove leftPart from targetString.
      let s:targetString = s:targetString[strlen(s:leftPart) : ]
      let s:copyOfTargetString = s:targetString

    " Get substIndex of rightPart.
      while s:substIndex != -1
        let s:copyOfTargetString = s:copyOfTargetString[s:substIndex + 1: ]
        let s:substIndex = stridx(s:copyOfTargetString, s:rightPart)
      endwhile

    " Remove rightPart from targetString.
      let s:outputLine = s:targetString[ : s:substIndex - strlen(s:rightPart)]

    else
      " Surround print string!
      let s:outputLine = s:leftPart . s:targetString . s:rightPart

    endif
  endif

  " write and indent
  call setline('.', s:outputLine)
  execute ':normal == '

endfunction

command! PrintSurround call PrintSurround()

