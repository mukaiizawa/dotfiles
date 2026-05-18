vim9script

def FF(): string
  if &fileformat ==# 'unix'
    return 'LF'
  elseif &fileformat ==# 'dos'
    return 'CRLF'
  endif
  return 'CR'
enddef

def Fenc(): string
  var val = &fenc
  if exists('+bomb') && &bomb
    val ..= '+BOM'
  endif
  return val
enddef

def Row(): string
  return join([line('.'), line('$')], '/')
enddef

def Col(): string
  return join([charcol('.'), charcol('$')], '/')
enddef

export def Build(): string
  return printf(
    '%%F%%#Exception#%%m%%r%%## %%= %%{&ft} %s %s [%s, %s]',
    Fenc(),
    FF(),
    Row(),
    Col()
  )
enddef
