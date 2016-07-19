
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
      if s:line =~ '^' . a:base
        call add(s:result, {
              \   'word' : s:line,
              \   'abbr' : s:line
              \ })
      endif
    endfor
    return s:result
  endif
endfunction

let s:unite_source = {
\   'name': 'lispwords',
\   "default_action" : "vsplit",
\ }

function! s:unite_source.gather_candidates(args, context)
  let s:path = $HOME . '/dotfiles/dict/clhs.dict'
  let s:lines = readfile(s:path)
  if !filereadable(s:path)
    call PrintError(printf('CompleteLispWords: "%s" is not found.', s:path))
    return []
  endif
  let s:result = []
  for s:line in s:lines
    let s:splitedLine = split(s:line, ',')
    call add(s:result, {
          \   'word' : split(s:line, '	')[0],
          \   'source' : 'lispwords',
          \   'kind' : 'jump_list',
          \   'action__path' : split(s:line, '	')[1],
          \   'action__line' :1,
          \ })
  endfor
  return s:result
endfunction

call unite#define_source(s:unite_source)
unlet s:unite_source

