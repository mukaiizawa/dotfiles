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

def GatherDirectoryFiles(dir: string): list<dict<any>>
  var result: list<dict<any>> = []
  if !isdirectory(dir)
    return result
  endif

  for name in readdir(dir)
    var target = unite#path#NormalizePath(dir .. '/' .. name)
    if getftype(target) !~# 'file\|link'
      continue
    endif

    add(result, {
      word: name,
      data: {
        path: target,
        line: 1,
      },
    })
  endfor

  return result
enddef

export def GatherCandidates(args: list<any>, context: dict<any>): list<dict<any>>
  var root = $HOME .. '/dotfiles/dict/'
  var dir = root .. FuzzyFileType(&ft)
  var path = dir .. '/index.csv'
  if !isdirectory(dir)
    execute 'edit ' .. fnameescape(root)
    return []
  endif

  var result: list<dict<any>> = []
  for line in readfile(path)
    var columns = split(line, "\t")
    if len(columns) < 2
      continue
    endif

    var target = unite#path#ExpandPath(columns[1])
    add(result, {
      word: columns[0],
      abbr: printf('%s %s', columns[0], target),
      data: {
        path: target,
        line: 1,
      },
    })
  endfor

  return result
enddef
