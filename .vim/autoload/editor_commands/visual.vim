vim9script

def GetIndent(start_line: number, end_line: number): string
  for line_number in range(start_line, end_line)
    var text = getline(line_number)
    if text !~# '^\s*$'
      return matchstr(text, '^\s*')
    endif
  endfor
  return ''
enddef

def BuildFoldComment(marker: string): string
  var commentstring = &l:commentstring
  if empty(commentstring) || commentstring !~# '%s'
    commentstring = '# %s'
  endif
  var parts = split(commentstring, '%s', true)
  var prefix = parts[0]
  var suffix = parts[1]
  if !empty(prefix) && prefix !~# '\s$'
    prefix ..= ' '
  endif
  if !empty(suffix) && suffix !~# '^\s'
    suffix = ' ' .. suffix
  endif
  return prefix .. marker .. suffix
enddef

export def Gzc()
  var start_line = getpos("'<")[1]
  var end_line = getpos("'>")[1]
  if start_line < 1 || end_line < 1
    return
  endif
  if start_line > end_line
    [start_line, end_line] = [end_line, start_line]
  endif
  var indent = GetIndent(start_line, end_line)
  var open_marker = indent .. BuildFoldComment('{{{')
  var close_marker = indent .. BuildFoldComment('}}}')
  append(end_line, ['', close_marker])
  append(start_line - 1, [open_marker, ''])
enddef
