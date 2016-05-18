
" SurroundWith {{{

function! SurroundWith(leftPart, rightPart, currentLine)

  " Move the first non-blank character of the line.
  execute ':normal ^'
  let s:targetString = getline(a:currentLine)[col('.') - 1 : ]    " Removed blanc of current line.
  let s:substIndex = stridx(s:targetString, a:leftPart)

  if s:substIndex == 0    " Is it surrounded already?

    " leftPart.
    " Remove leftPart from targetString.
    let s:targetString = s:targetString[strlen(a:leftPart) : ]
    let s:copyOfTargetString = s:targetString

    " rightPart.
    if strlen(a:rightPart) > 0
      " Get substIndex of rightPart.
      while s:substIndex != -1
        let s:copyOfTargetString = s:copyOfTargetString[s:substIndex + 1: ]
        let s:substIndex = stridx(s:copyOfTargetString, a:rightPart)
      endwhile
      " Remove rightPart from targetString.
      let s:outputLine = s:targetString[ : s:substIndex - strlen(a:rightPart)]
    else
      " Case of empty rightPart.
      let s:outputLine = s:targetString
    endif

  else
    " Surround print string!
    let s:outputLine = a:leftPart . s:targetString . a:rightPart

  endif

  " write and indent
  call setline(a:currentLine, s:outputLine)
  execute ':normal == '

endfunction


" }}}
" PrintSurround {{{

function! PrintSurround() range

  let s:filetype = &filetype
  let s:printDic = {
        \   'c'          : ['printf("' , '\n");'],
        \   'cpp'        : ['std::cout << "' , '";'],
        \   'dosbatch'   : ['echo "' , '"'],
        \   'html'       : ['<script>document.write("' , '")</script>'],
        \   'java'       : ['System.out.println(' , ');'],
        \   'javascript' : ['document.write(' , ');'],
        \   'jsp'        : ['document.write(' , ');'],
        \   'lisp'       : ['#o' , ''],
        \   'peal'       : ['print "' , '";'],
        \   'python'     : ['print("' , '")'],
        \   'ruby'       : ['puts "' , '"'],
        \   'vb'         : ['MsgBox ' , ''],
        \   'vim'        : ['echo "' , '"'],
        \
        \ }

  if has_key(s:printDic, s:filetype ) != 1    " Is this file type supported?
    echo "This file type isn't supported."
    return
  else

    let s:leftPart = (s:printDic[s:filetype])[0]
    let s:rightPart = (s:printDic[s:filetype])[1]

    " Surround each line
    for n in range(a:firstline, a:lastline)
      call SurroundWith(s:leftPart, s:rightPart, n)
    endfor

  endif

endfunction

command! -range PrintSurround <line1>, <line2>call PrintSurround()


" }}}
