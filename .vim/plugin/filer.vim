vim9script

def OnFilerVistDir()
  var dir = filer#BufferDir()
  if !empty(dir)
    execute 'lcd ' .. fnameescape(dir)
    unite#file#AppendDirectory(dir)
  endif
enddef

augroup user_filer_directory
  autocmd!
  autocmd User FilerVisitDir call OnFilerVistDir()
augroup END
