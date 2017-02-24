function! CompleteWords(findstart, base)
  let s:commonPath = $HOME . '/dotfiles/word/common.word'
  let s:path = $HOME . '/dotfiles/word/' . expand("%:e") . '.word'
  if a:findstart
    " get cursor word.
    let s:cur_text = strpart(getline('.'), 0, col('.') - 1)
    return match(s:cur_text, '\f*$')
  else
    " find word matching with `a:base'
    let s:lines = readfile(s:commonPath) +
          \ (filereadable(s:path)?
          \   readfile(s:path):
          \   [])
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
\   'name': 'help',
\   "default_action" : "vsplit",
\ }

function! s:unite_source.gather_candidates(args, context)
  let s:path = $HOME . '/dotfiles/dict/' . expand("%:e") . '.dict'
  if !filereadable(s:path)
    call PrintError(printf("Unite help: The file type`%s' is not implemented.", expand("%:e")))
    return []
  endif
  let s:result = []
  let s:lines = readfile(s:path)
  for s:line in s:lines
    let s:splitedLine = split(s:line, ',')
    call add(s:result, {
          \   'word' : split(s:line, '	')[0],
          \   'source' : 'help',
          \   'kind' : 'jump_list',
          \   'action__path' : split(s:line, '	')[1],
          \   'action__line' :1,
          \ })
  endfor
  return s:result
endfunction

call unite#define_source(s:unite_source)
unlet s:unite_source
