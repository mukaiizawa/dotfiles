" editor commands nnore map.

fu! ec#nn#h()
  if &wrap
    norm g0
  el
    norm 0
  en
endf

fu! ec#nn#l()
  if &wrap
    norm g$
  el
    norm $
  en
endf
