
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
    let s:targetString = getline('.')[col('.') - 1 : strlen(getline('.'))]    " Removed blanc of current line.
    let s:frontPrint = (s:printDic[s:keyOfPrintDic])[0]
    let s:backPrint = (s:printDic[s:keyOfPrintDic])[1]
    let s:substIndex = stridx(s:targetString, s:frontPrint)


    if s:substIndex == 0    " Is it surrounded already?
    " Remove frontPrint from targetString.
      let s:targetString = s:targetString[s:substIndex + strlen(s:frontPrint) : strlen(s:targetString)]
      let s:copyOfTargetString = s:targetString

    " Get substIndex of backPrint.
      while s:substIndex != -1
        let s:copyOfTargetString = s:copyOfTargetString[s:substIndex + 1 : strlen(s:copyOfTargetString)]
        let s:substIndex = stridx(s:copyOfTargetString, s:backPrint)
      endwhile

    " Remove backPrint from targetString.
      let s:outputLine = s:targetString[0 : s:substIndex - strlen(s:backPrint)]

    else

      let s:outputLine = 
            \  (s:printDic[s:keyOfPrintDic])[0] .
            \  s:targetString .
            \  (s:printDic[s:keyOfPrintDic])[1]

    endif
  endif

  " write and indent
  call setline('.', s:outputLine)
  execute ':normal == '

endfunction

command! PrintSurround call PrintSurround()

