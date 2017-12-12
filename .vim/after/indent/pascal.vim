setlocal indentexpr=GetPascalIndent(v:lnum)
setlocal indentkeys+==end;,==const,==type,==var,==begin,==repeat,==until,==for
setlocal indentkeys+==program,==function,==procedure,==record,==if,==else,==case

function! GetPascalIndent(line_num)
  let line_num = a:line_num
  let prev_line = getline(a:line_num - 1)
  let prev_indent = indent(prevnonblank(a:line_num - 1))
  let curr_line = getline(a:line_num)

  if curr_line =~ '^\s*program'
    return 0
  endif

  if curr_line !~ "^\s*begin" && prev_line =~ '^\s*else$'
    return indent(a:line_num - 1) + &shiftwidth
  endif

  if prev_line =~ '^\s*\(begin\|for\|with\)'
    return indent(a:line_num - 1) + &shiftwidth
  endif

  if curr_line =~ '^\s*end'
    let level = 1
    while line_num > 0 && level > 0
      let line_num = line_num - 1
      let prev_line = getline(line_num)
      if prev_line =~ '^\s*begin'
        let level = level - 1
      elseif prev_line =~ '^\s*end'
        let level = level + 1
      endif
    endwhile
    return indent(line_num)
  endif

  return prev_indent
endfunction
