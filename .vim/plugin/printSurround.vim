
function! PrintSurround()

  let s:printSurroundKey = &filetype
  let s:printSurroundDic = {
        \  'vim'  : ['echo "', '"'],
        \  'c'    : ['printf("', '\n");'],
        \  'java' : ['Systemm.out.println("', '");'],
        \  'lisp' : ['(print ', ')'],
        \
        \  }

if has_key(s:printSurroundDic, s:printSurroundKey ) == 1
  execute ':normal I ' . remove(s:printSurroundDic[s:printSurroundKey], 0)
  execute ':normal A ' . remove(s:printSurroundDic[s:printSurroundKey], 0)
  execute ':normal ='
elseif
  echo 'This file type not supported.'
endif

endfunction

command! PrintSurround call PrintSurround()


