
function! PrintSurround()

  let s:filetype = &filetype
  let s:printDic = {
        \  'c'          : ['printf("' , '\n");'],
        \  'cpp'        : ['std::cout << "' , '";'],
        \  'dosbatch'   : ['echo "' , '"'],
        \  'html'       : ['<script>document.write("' , '")</script>'],
        \  'java'       : ['System.out.println("' , '");'],
        \  'javascript' : ['document.write("' , '");'],
        \  'jsp'        : ['document.write("' , '");'],
        \  'lisp'       : ['(print "' , '")'],
        \  'peal'       : ['print "' , '";'],
        \  'python'     : ['print "' , '"'],
        \  'ruby'       : ['puts "' , '"'],
        \  'vim'        : ['echo "' , '"'],
        \
        \  }

  if has_key(s:printDic, s:filetype ) != 1    " Is this file type supported?
    echo "This file type isn't supported."
    return
  else

    let s:leftPart = (s:printDic[s:filetype])[0]
    let s:rightPart = (s:printDic[s:filetype])[1]
    call SurroundWith(s:leftPart, s:rightPart)

  endif

endfunction

command! PrintSurround call PrintSurround()

