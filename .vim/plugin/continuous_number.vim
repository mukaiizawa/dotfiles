function! ContinuousNumber(count)
  let c = col('.')
  for n in range(1, a:count? a:count - line('.'): 1)
    exec 'normal! j' . n . ''
    call cursor('.', c)
  endfor
endfunction

command! -count ContinuousNumber call ContinuousNumber(<count>)
