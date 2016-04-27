
function! CompleteLispWords(findstart, base)
  let s:path = $HOME . '/dotfiles/dict/lisp.dict'
  if !filereadable(s:path)
    call PrintError(printf('CompleteLispWords: "%s" is not found.', s:path))
    return []
  endif
  if a:findstart
    " locate the start of the word
    let line = getline('.')
    let start = col('.') - 1
    while start > 0 && line[start - 1] !~ '(\|\ \|)'
      let start -= 1
    endwhile
    return start
  else
    " find word matching with `a:base'
    let s:lines = readfile(s:path)
    let s:result = []
    for s:line in s:lines
      let s:splitedLine = split(s:line, ',')
      if len(s:splitedLine) == 3 && s:splitedLine[0] =~ '^' . a:base
        call add(s:result, {
              \   'word' : s:splitedLine[0],
              \   'abbr' : printf('%s %s => %s',
              \                    s:splitedLine[0], s:splitedLine[1], s:splitedLine[2])
              \ })
      endif
    endfor
    return s:result
  endif
endfunction


