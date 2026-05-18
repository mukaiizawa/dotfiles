" status_line.vim

function! status_line#ff()
  if &fileformat == 'unix'
    return 'LF'
  elseif &fileformat == 'dos'
    return 'CRLF'
  else
    return 'CR'
  endif
endfunction

function! status_line#fenc()
  let val = &fenc
  if (exists('+bomb') && &bomb)
    let val = val . '+BOM'
  endif
  return val
endfunction

function! status_line#row()
  return join([line('.'), line('$')], '/')
endfunction

function! status_line#col()
  return join([col('.'), col('$')], '/')
endfunction
