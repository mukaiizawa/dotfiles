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

function InsertDate()
  execute ":normal a" . strftime("%Y-%m-%d")
endfunction
