" editor commands vnore map.

fu! ec#vn#gzc() range
  let prefix = caw#get_var('caw_oneline_comment', '')
  let suffix = ''
  if empty(prefix)
    let se = caw#get_var('caw_wrap_oneline_comment', [])
    let prefix = se[0]
    let suffix = se[1]
  en
  call append(getpos("'>")[1], prefix . " }}}" . suffix)
  call append(getpos("'<")[1] - 1, prefix . " {{{" . suffix)
endf
