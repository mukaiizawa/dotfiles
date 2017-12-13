setlocal indentexpr=GetPascalIndent(v:lnum)
setlocal indentkeys+==end;,==const,==type,==var,==begin,==repeat,==until,==for
setlocal indentkeys+==program,==function,==procedure,==record,==if,==else,==case

function! GetPascalIndent(line_num)
  let line_num = a:line_num
  let curr_line = getline(line_num)
  let prev_line = getline(line_num - 1)
  let prev_indent = indent(line_num - 1)

  let line_first = '^\s*'
  let line_end = '\(\s\|{.*}\|;\)*$'

  if curr_line =~ line_first . 'program'
    return 0
  endif

  if curr_line =~ line_first . 'procedure'
    return indent(line_num)
  endif

  let level_up =  '\(begin\|case\|repeat\)'
  let level_down =  '\(end\|until\)'

  if prev_line =~ line_first . level_up
    if prev_line =~ level_down . line_end
      return prev_indent
    endif
    return prev_indent + &shiftwidth
  endif

  if curr_line =~ line_first . level_down
    let level = 1
    while line_num > 0 && level > 0
      let line_num = line_num - 1
      let prev_line = getline(line_num)
      if prev_line =~ line_first . level_up
        if prev_line =~ level_down . line_end
          continue
        endif
        let level = level - 1
      elseif prev_line =~ line_first . level_down
        let level = level + 1
      endif
    endwhile
    return indent(line_num)
  endif

  return prev_indent
endfunction
