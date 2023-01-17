" for mapping

fu! MoveLeftEnd()
  if &wrap
    norm g0
  el
    norm 0
  en
endf

fu! MoverRightEnd()
  if &wrap
    norm g$
  el
    norm $
  en
endf

fu! Xfold() range
  let s = caw#get_var('caw_oneline_comment', '')
  let e = ''
  if empty(s)
    let se = caw#get_var('caw_wrap_oneline_comment', [])
    let s = se[0]
    let e = se[1]
  en
  call append(a:firstline - 1, s . " {{{" . e)
  call append(a:firstline, '')
  call append(a:lastline + 2, '')
  call append(a:lastline + 3, s . " }}}" . e)
endf

fu! InsertDate()
  exe ":normal a" . strftime("%Y-%m-%d")
endf
