" complete.vim

let s:unite_source = {
      \   'name': 'help',
      \   "default_action" : "vsplit",
      \ }

fu! CompleteEnglishWords(findstart, base)
  if a:findstart
    " get cursor word.
    let s:cur_text = strpart(getline('.'), 0, col('.') - 1)
    retu match(s:cur_text, '\f*$')
  el
    " find word matching with `a:base'
    let s:result = []
    for s:line in readfile($HOME . '/dotfiles/word/en')
      if s:line =~ '^' . a:base
        call add(s:result, { 'word': s:line, 'abbr': s:line })
      en
    endfo
    retu s:result
  en
endf

fu! s:FuzzyFileType(fileType)
  if a:fileType =~ '\(html\|htm\|xhtml\|jsp\|css\|javascript\)'
    retu 'web'
  elsei a:fileType =~ '.git.*'
    retu 'git'
  elsei a:fileType == 'cpp'
    retu 'c'
  el
    retu a:fileType
  en
endf

fu! s:unite_source.gather_candidates(args, context)
  let s:fileType = &ft
  let s:root = $HOME . '/dotfiles/dict/'
  let s:path = s:root . s:FuzzyFileType(s:fileType) . '/index.csv'
  if !filereadable(s:path)
    exe 'VimFiler' s:root
    retu []
  en
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
  endfo
  retu s:result
endf

call unite#define_source(s:unite_source)
unl s:unite_source
