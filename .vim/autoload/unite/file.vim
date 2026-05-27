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

def FileValidator(paths: list<string>): list<string>
  return file_do_validate ? ValidateFileCandidates(paths) : copy(paths)
enddef

def DirectoryValidator(paths: list<string>): list<string>
  return file_do_validate ? ValidateDirectoryCandidates(paths) : copy(paths)
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

export def AppendCurrent()
  if &l:buftype =~# 'help\|nofile' || &l:previewwindow
    return
  endif
  Append(expand('%:p'))
enddef

export def GatherFileCandidates(): list<dict<any>>
  return GatherStoreCandidates(file_mru)
enddef

export def GatherDirectoryCandidates(args: list<any> = [], ctx: dict<any> = {}): list<dict<any>>
  return GatherStoreCandidates(directory_mru)
enddef

export def GatherCandidates(args: list<any> = [], ctx: dict<any> = {}): list<dict<any>>
  return GatherFileCandidates()
enddef

export def Append(filename: string)
  var path = unite#path#NormalizePath(filename)
  if IsFileCandidate(path)
    unite#store#Append(file_mru, path)
  endif

  var bufnr_value = bufnr(filename)
  var filetype = bufnr_value > 0 ? getbufvar(bufnr_value, '&filetype') : ''
  if filetype ==# 'vimfiler' && type(getbufvar(bufnr_value, 'vimfiler')) == v:t_dict
    path = getbufvar(bufnr_value, 'vimfiler').current_dir
  elseif filetype ==# 'vimshell' && type(getbufvar(bufnr_value, 'vimshell')) == v:t_dict
    path = getbufvar(bufnr_value, 'vimshell').current_dir
  else
    path = fnamemodify(path, ':p:h')
  endif

  path = unite#path#NormalizePath(path)
  if IsDirectoryCandidate(path)
    unite#store#Append(directory_mru, path)
  endif
enddef

export def Reload()
  unite#store#Reload(file_mru)
  unite#store#Reload(directory_mru)
enddef

export def Save(opts: dict<any> = {})
  if get(opts, 'event', '') ==# 'VimLeavePre'
    unite#store#Validate(file_mru)
    unite#store#Validate(directory_mru)
  endif
  unite#store#Save(file_mru)
  unite#store#Save(directory_mru)
enddef
