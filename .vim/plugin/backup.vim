function! MakeBackupFile()

  if has('win32') || has ('win64')
    let s:backupDir = $Home . '/dotfiles/.back'
  else
    let s:backupDir = $Home . '/dotfiles/.back'
  endif

  if isdirectory(s:backupDir) == 0
    call mkdir(s:backupDir , 'p')
  endif

  if exists("*strftime")    " if executable 'strftime'
    let s:today = strftime("%y%m%d")
    if isdirectory(s:backupDir . '/' . s:today) == 0
      call mkdir(s:backupDir . '/' . s:today , 'p')
    endif
    return writefile(getline(1,'$'),
          \  s:backupDir .
          \  '/' . s:today . 
          \  '/' . expand('%:t') . '.' . localtime())
  endif

  return writefile(getline(1,'$'),
        \  s:backupDir .
        \  '/' . expand('%:t') . '.' . localtime())

endfunction

command! MakeBackupFile call MakeBackupFile()

augroup makeBackupFile
  autocmd!
  autocmd BufWritePre * nested :MakeBackupFile
augroup END

