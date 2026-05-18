" complete.vim

let s:unite_source = {
      \   'name': 'help',
      \   "default_action" : "vsplit",
      \ }

function! s:FuzzyFileType(fileType)
  if a:fileType =~ '\(html\|htm\|xhtml\|jsp\|css\|javascript\)'
    return 'web'
  elseif a:fileType =~ '.git.*'
    return 'git'
  elseif a:fileType == 'cpp'
    return 'c'
  else
    return a:fileType
  endif
endfunction

function! s:unite_source.gather_candidates(args, context)
  let s:fileType = &ft
  let s:root = $HOME . '/dotfiles/dict/'
  let s:path = s:root . s:FuzzyFileType(s:fileType) . '/index.csv'
  if !filereadable(s:path)
    execute 'VimFiler' s:root . '/etc'
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
