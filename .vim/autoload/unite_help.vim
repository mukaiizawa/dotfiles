vim9script

def FuzzyFileType(fileType: string): string
  if fileType =~ '\v(html|htm|xhtml|jsp|css|javascript)'
    return 'web'
  elseif fileType =~ '\.git'
    return 'git'
  elseif fileType ==# 'cpp'
    return 'c'
  endif

  return fileType
enddef

export def GatherCandidates(args: list<any>, context: dict<any>): list<dict<any>>
  var root = $HOME .. '/dotfiles/dict/'
  var path = root .. FuzzyFileType(&ft) .. '/index.csv'
  if !filereadable(path)
    if exists(':VimFiler') == 2
      execute 'VimFiler ' .. fnameescape(root .. 'etc')
    endif
    return []
  endif

  var result: list<dict<any>> = []
  for line in readfile(path)
    var columns = split(line, "\t")
    if len(columns) < 2
      continue
    endif

    add(result, {
      word: columns[0],
      source: 'help',
      kind: 'jump_list',
      action__path: columns[1],
      action__line: 1,
    })
  endfor

  return result
enddef
