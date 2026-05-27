vim9script

var repo_path = unite#store#CacheBaseDir() .. '/repositories'

def PathToDirectory(path: string): string
  return unite#path#SubstitutePathSeparator(isdirectory(path) ? path : fnamemodify(path, ':p:h'))
enddef

def PathToRepositoryGit(path: string): string
  var parent = path
  while true
    var git_path = parent .. '/.git'
    if isdirectory(git_path) || filereadable(git_path)
      return parent
    endif
    var next = fnamemodify(parent, ':h')
    if next ==# parent
      return ''
    endif
    parent = next
  endwhile
  return ''
enddef

def PathToRepositorySvn(path: string): string
  var parent = path
  while true
    if isdirectory(parent .. '/.svn')
      return parent
    endif
    var next = fnamemodify(parent, ':h')
    if next ==# parent
      return ''
    endif
    parent = next
  endwhile
  return ''
enddef

def PathToRepository(path: string): string
  var directory = PathToDirectory(path)
  for vcs in ['.git', '.svn']
    var root = vcs ==# '.git' ? PathToRepositoryGit(directory) : PathToRepositorySvn(directory)
    if !empty(root)
      return unite#path#NormalizePath(root)
    endif
  endfor
  return ''
enddef

def ValidateRepositories(paths: list<string>): list<string>
  return filter(copy(paths), (_, path) => isdirectory(path) || getftype(path) ==# 'link')
enddef

def GatherStoreCandidates(store: any): list<dict<any>>
  return mapnew(unite#store#Entries(store), (_, path) => ({
    word: path,
    data: {
      path: path,
    },
  }))
enddef

var repositories = unite#store#NewCacheListStore(repo_path, 1000, function('ValidateRepositories'))

export def Append(filename: string)
  var path = unite#path#NormalizePath(filename)
  if empty(path) || getftype(path) !~# 'file\|dir\|link'
    return
  endif
  var root = PathToRepository(path)
  if empty(root)
    return
  endif
  unite#store#Append(repositories, root)
enddef

export def AppendCurrent()
  if &l:buftype =~# 'help\|nofile' || &l:previewwindow
    return
  endif
  Append(unite#path#ExpandPath('%:p'))
enddef

export def Repository(path: string): string
  var normalized = unite#path#NormalizePath(path)
  return empty(normalized) ? '' : PathToRepository(normalized)
enddef

export def CurrentRepository(): string
  if &l:buftype =~# 'help\|nofile' || &l:previewwindow
    return ''
  endif
  var path = unite#path#ExpandPath('%:p')
  if empty(path) || getftype(path) !~# 'file\|link'
    return ''
  endif
  return Repository(path)
enddef

export def Candidates(): list<dict<any>>
  return GatherStoreCandidates(repositories)
enddef

export def GatherCandidates(args: list<any> = [], ctx: dict<any> = {}): list<dict<any>>
  return Candidates()
enddef

export def Reload()
  unite#store#Reload(repositories)
enddef

export def Save()
  unite#store#Validate(repositories)
  unite#store#Save(repositories)
enddef
