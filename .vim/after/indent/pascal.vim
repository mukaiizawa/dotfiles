setl inde=GetPascalIndent(v:lnum)
setl inde+==end;,==const,==type,==var,==begin,==repeat,==until,==for
setl inde+==program,==function,==procedure,==record,==if,==else,==case

fu! GetPascalIndent(line_num)
  let line_num = a:line_num
  let curr_line = getline(line_num)
  let prev_line = getline(line_num - 1)
  let prev_indent = indent(line_num - 1)
  let line_first = '^\s*'
  let line_end = '\(\s\|{.*}\|;\)*$'
  if curr_line =~ line_first . 'program'
    retu 0
  en
  if curr_line =~ line_first . '\(procedure\|function\)'
    retu indent(line_num)
  en
  let level_up =  '\(begin\|case\|repeat\)'
  let level_down =  '\(end\|until\)'
  if prev_line =~ line_first . level_up
    if prev_line =~ level_down . line_end
      retu prev_indent
    en
    retu prev_indent + &shiftwidth
  en
  if curr_line =~ line_first . level_down
    let level = 1
    while line_num > 0 && level > 0
      let line_num = line_num - 1
      let prev_line = getline(line_num)
      if prev_line =~ line_first . level_up
        if prev_line =~ level_down . line_end
          continue
        en
        let level = level - 1
      elsei prev_line =~ line_first . level_down
        let level = level + 1
      en
    endw
    retu indent(line_num)
  en
  retu prev_indent
endf
