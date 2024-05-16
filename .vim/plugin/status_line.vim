" status_line.vim

fu! status_line#ff()
  if &fileformat == 'unix'
    retu 'LF'
  elsei &fileformat == 'dos'
    retu 'CRLF'
  el
    retu 'CR'
  en
endf

fu! status_line#fenc()
  let val = &fenc
  if (exists('+bomb') && &bomb)
    let val = val . '+BOM'
  en
  retu val
endf

fu! status_line#row()
  retu join([line('.'), line('$')], '/')
endf

fu! status_line#col()
  retu join([col('.'), col('$')], '/')
endf
