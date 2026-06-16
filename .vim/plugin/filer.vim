vim9script

def AppendFilerDirectory()
  var dir = filer#BufferDir()
  if !empty(dir)
    unite#file#AppendDirectory(dir)
  endif
enddef

augroup user_filer_directory
  autocmd!
  autocmd User FilerVisitDir call AppendFilerDirectory()
augroup END
