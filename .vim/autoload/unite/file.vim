vim9script

var base = unite#store#CacheBaseDir()
var file_do_validate = true
var file_mru_path = unite#path#SubstitutePathSeparator(base .. '/mru-file')
var file_mru_limit = 2000
var file_mru_ignore_pattern = '\~$' ..
      '\|^\%(http[s]\|file\|quickrun\):' ..
      '\|^\%(//\|\\\\\)' ..
      '\|\.\%(o\|exe\|dll\|bak\|zwc\|pyc\|sw\)$'
var directory_mru_path = unite#path#SubstitutePathSeparator(base .. '/mru-directory')
var directory_mru_limit = 2000
var directory_mru_ignore_pattern = ''
var repository_mru_path = unite#path#SubstitutePathSeparator(base .. '/repositories')
var repository_mru_limit = 1000

def IsFileCandidate(path: string): bool
  var ignore = !empty(file_mru_ignore_pattern) && path =~ file_mru_ignore_pattern
  return !ignore && (getftype(path) ==# 'file' || getftype(path) ==# 'link' || path =~ '^\h\w\+:')
enddef

def IsDirectoryCandidate(path: string): bool
  var ignore = !empty(directory_mru_ignore_pattern) && path =~ directory_mru_ignore_pattern
  return !ignore && (isdirectory(path) || path =~ '^\h\w\+:')
enddef

def ValidateFileCandidates(paths: list<string>): list<string>
  return filter(copy(paths), (_, path) => IsFileCandidate(path))
enddef

def ValidateDirectoryCandidates(paths: list<string>): list<string>
  return filter(copy(paths), (_, path) => IsDirectoryCandidate(path))
enddef

def ValidateRepositoryCandidates(paths: list<string>): list<string>
  return filter(copy(paths), (_, path) => isdirectory(path) || getftype(path) ==# 'link')
enddef

def FileValidator(paths: list<string>): list<string>
  return file_do_validate ? ValidateFileCandidates(paths) : copy(paths)
enddef

def DirectoryValidator(paths: list<string>): list<string>
  return file_do_validate ? ValidateDirectoryCandidates(paths) : copy(paths)
enddef

def RepositoryValidator(paths: list<string>): list<string>
  return file_do_validate ? ValidateRepositoryCandidates(paths) : copy(paths)
enddef

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

def GatherStoreCandidates(store: any): list<dict<any>>
  return mapnew(unite#store#Entries(store), (_, path) => ({
    word: path,
    data: {
      path: path,
    },
  }))
enddef

var file_mru = unite#store#NewCacheListStore(file_mru_path, file_mru_limit, function('FileValidator'))
var directory_mru = unite#store#NewCacheListStore(directory_mru_path, directory_mru_limit, function('DirectoryValidator'))
var repository_mru = unite#store#NewCacheListStore(repository_mru_path, repository_mru_limit, function('RepositoryValidator'))

def AppendRepository(filename: string)
  var path = unite#path#NormalizePath(filename)
  if empty(path) || getftype(path) !~# 'file\|dir\|link'
    return
  endif
  var root = PathToRepository(path)
  if empty(root)
    return
  endif
  unite#store#Append(repository_mru, root)
enddef

def Append(filename: string)
  var path = unite#path#NormalizePath(filename)
  if IsFileCandidate(path)
    unite#store#Append(file_mru, path)
  endif

  var directory = path
  var bufnr_value = bufnr(filename)
  var filetype = bufnr_value > 0 ? getbufvar(bufnr_value, '&filetype') : ''
  if filetype ==# 'vimfiler' && type(getbufvar(bufnr_value, 'vimfiler')) == v:t_dict
    directory = getbufvar(bufnr_value, 'vimfiler').current_dir
  elseif filetype ==# 'vimshell' && type(getbufvar(bufnr_value, 'vimshell')) == v:t_dict
    directory = getbufvar(bufnr_value, 'vimshell').current_dir
  elseif !IsDirectoryCandidate(path)
    directory = fnamemodify(path, ':p:h')
  endif

  AppendDirectory(directory)
enddef

export def AppendDirectory(directory: string)
  var path = unite#path#NormalizePath(directory)
  if !IsDirectoryCandidate(path)
    return
  endif
  unite#store#Append(directory_mru, path)
  if !unite#store#IsSudo()
    AppendRepository(path)
  endif
enddef

export def AppendCurrentBuffer()
  if &l:buftype =~# 'help\|nofile' || &l:previewwindow
    return
  endif
  Append(expand('%:p'))
enddef

export def GatherDirectoryCandidates(args: list<any> = [], ctx: dict<any> = {}): list<dict<any>>
  return GatherStoreCandidates(directory_mru)
enddef

export def GatherRepositoryCandidates(args: list<any> = [], ctx: dict<any> = {}): list<dict<any>>
  return GatherStoreCandidates(repository_mru)
enddef

export def GatherCandidates(args: list<any> = [], ctx: dict<any> = {}): list<dict<any>>
  return GatherStoreCandidates(file_mru)
enddef

export def Save(opts: dict<any> = {})
  if get(opts, 'event', '') ==# 'VimLeavePre'
    unite#store#Validate(file_mru)
    unite#store#Validate(directory_mru)
    unite#store#Validate(repository_mru)
  endif
  unite#store#Save(file_mru)
  unite#store#Save(directory_mru)
  unite#store#Save(repository_mru)
enddef
