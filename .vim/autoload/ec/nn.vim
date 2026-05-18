" editor commands nnore map.

function! ec#nn#h()
  if &wrap
    normal g0
  else
    normal 0
  endif
endfunction

function! ec#nn#l()
  if &wrap
    normal g$
  else
    normal $
  endif
endfunction
