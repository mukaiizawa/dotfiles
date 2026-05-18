vim9script

export def H()
  if &wrap
    execute 'normal! g0'
  else
    execute 'normal! 0'
  endif
enddef

export def L()
  if &wrap
    execute 'normal! g$'
  else
    execute 'normal! $'
  endif
enddef
