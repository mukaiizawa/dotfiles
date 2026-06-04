vim9script

setlocal indentexpr=DotfilesPascalIndent(v:lnum)
setlocal indentkeys+==end;,==const,==type,==var,==begin,==repeat,==until,==for
setlocal indentkeys+==program,==function,==procedure,==record,==if,==else,==case

def DotfilesPascalIndent(line_num: number): number
  var current_line_number = line_num
  var curr_line = getline(current_line_number)
  var prev_line = getline(current_line_number - 1)
  var prev_indent = indent(current_line_number - 1)
  const line_first = '^\s*'
  const line_end = '\(\s\|{.*}\|;\)*$'
  if curr_line =~ line_first . 'program'
    return 0
  endif
  if curr_line =~ line_first . '\(procedure\|function\)'
    return indent(current_line_number)
  endif
  const level_up =  '\(begin\|case\|repeat\)'
  const level_down =  '\(end\|until\)'
  if prev_line =~ line_first . level_up
    if prev_line =~ level_down . line_end
      return prev_indent
    endif
    return prev_indent + &shiftwidth
  endif
  if curr_line =~ line_first . level_down
    var level = 1
    while current_line_number > 0 && level > 0
      current_line_number -= 1
      prev_line = getline(current_line_number)
      if prev_line =~ line_first . level_up
        if prev_line =~ level_down . line_end
          continue
        endif
        level -= 1
      elseif prev_line =~ line_first . level_down
        level += 1
      endif
    endwhile
    return indent(current_line_number)
  endif
  return prev_indent
enddef
