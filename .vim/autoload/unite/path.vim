vim9script

export def SubstitutePathSeparator(path: string): string
  return substitute(path, '\\', '/', 'g')
enddef

export def ExpandPath(path: string): string
  return SubstitutePathSeparator(expand(path))
enddef

export def NormalizePath(path: string): string
  if empty(path)
    return ''
  endif
  return SubstitutePathSeparator(fnamemodify(path, ':p'))
enddef
