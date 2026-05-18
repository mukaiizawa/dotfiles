vim9script

export def Gzc()
  var prefix = caw#get_var('caw_oneline_comment', '', [line('.')])
  var suffix = ''
  if empty(prefix)
    var se = caw#get_var('caw_wrap_oneline_comment', [], [line('.')])
    prefix = se[0]
    suffix = se[1]
  endif
  append(getpos("'>")[1], prefix .. ' }}}' .. suffix)
  append(getpos("'<")[1] - 1, prefix .. ' {{{' .. suffix)
enddef
