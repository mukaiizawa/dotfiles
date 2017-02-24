function! MakeBackupFile()

  if has('win32') || has ('win64')
    let s:backupDir = $HOME . '/.back'
  else
    let s:backupDir = $HOME . '/.back/'
  endif

  if isdirectory(s:backupDir) == 0
    call mkdir(s:backupDir , 'p')
  endif

  if filereadable(expand('%')) && filewritable(expand('%'))   " unless new file
    if exists("*strftime")    " is executable function `strftime'
      let s:today = strftime("%y%m%d")
      if isdirectory(s:backupDir . '/' . s:today) == 0
        call mkdir(s:backupDir . '/' . s:today , 'p')
      endif
      return writefile(readfile(expand('%')),
            \  s:backupDir .
            \  '/' . s:today . 
            \  '/' . expand('%:t') . '.' . localtime())
    else    " not implemented `strftime'
      return writefile(readfile(expand('%')),
            \  s:backupDir .
            \  '/' . expand('%:t') . '.' . localtime())
    endif
  endif

endfunction

command! MakeBackupFile call MakeBackupFile()

augroup makeBackupFile
  autocmd!
  autocmd BufWritePre * nested :MakeBackupFile
augroup END
