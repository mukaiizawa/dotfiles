" surround.vim

fu! s:SurroundWith(leftPart, rightPart, currentLine)
  " move the first non-blank character of the line.
  exe ':normal ^'
  " removed blanc of current line.
  let s:targetString = getline(a:currentLine)[col('.') - 1 : ]
  let s:substIndex = stridx(s:targetString, a:leftPart)
  if s:substIndex == 0    " Is it surrounded already?
    " leftPart.
    let s:targetString = s:targetString[strlen(a:leftPart) : ]
    let s:copyOfTargetString = s:targetString
    " rightPart.
    if strlen(a:rightPart) > 0
      while s:substIndex != -1
        let s:copyOfTargetString = s:copyOfTargetString[s:substIndex + 1: ]
        let s:substIndex = stridx(s:copyOfTargetString, a:rightPart)
      endw
      let s:outputLine = s:targetString[ : s:substIndex - strlen(a:rightPart)]
    else
      " case of empty rightPart.
      let s:outputLine = s:targetString
    en
  else
    " surround print string!
    let s:outputLine = a:leftPart . s:targetString . a:rightPart
  en
  " write and indent
  call setline(a:currentLine, s:outputLine)
  exe ':normal == '
endf

fu! PutPrintFunction() range
  let s:filetype = &filetype
  let s:printDic = {
        \   'c'          : ['printf("%d\n", ' , ');'],
        \   'cpp'        : ['std::cout << "' , '";'],
        \   'cs'         : ['Debug.Log(' , ');'],
        \   'dosbatch'   : ['echo "' , '"'],
        \   'html'       : ['console.log(' , ');'],
        \   'java'       : ['System.out.println(' , ');'],
        \   'javascript' : ['console.log(' , ');'],
        \   'jsp'        : ['console.log(' , ');'],
        \   'lisp'       : ['(print ' , ')'],
        \   'paren'      : ['(write ' , ')'],
        \   'peal'       : ['print ' , ';'],
        \   'python'     : ['print(' , ')'],
        \   'ruby'       : ['puts "' , '"'],
        \   'rust'       : ['println!("{}", ' , ');'],
        \   'vb'         : ['Debug.Print ' , ''],
        \   'vim'        : ['echo ' , ''],
        \   'xhtml'      : ['console.log(' , ');'],
        \
        \ }
  if has_key(s:printDic, s:filetype ) != 1    " is this file type supported?
    echo "This file type isn't supported."
    retu
  else
    let s:leftPart = (s:printDic[s:filetype])[0]
    let s:rightPart = (s:printDic[s:filetype])[1]
    " surround each line
    for n in range(a:firstline, a:lastline)
      call s:SurroundWith(s:leftPart, s:rightPart, n)
    endfo
  en
endf

com! -range PutPrintFunction <line1>, <line2>call PutPrintFunction()
