" for mapping

function MoveLeftEnd()
  if &wrap
    normal g0
  else
    normal 0
  endif
endfunction

function MoverRightEnd()
  if &wrap
    normal g$
  else
    normal $
  endif
endfunction

function Xfold() range
  let s = caw#get_var('caw_oneline_comment', '')
  let e = ''
  if empty(s)
    let se = caw#get_var('caw_wrap_oneline_comment', [])
    let s = se[0]
    let e = se[1]
  endif
  call append(a:firstline - 1, s . " {{{" . e)
  call append(a:firstline, '')
  call append(a:lastline + 2, '')
  call append(a:lastline + 3, s . " }}}" . e)
endfunction

function InsertDate()
  execute ":normal a" . strftime("%Y-%m-%d")
endfunction
