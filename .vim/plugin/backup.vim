function! MakeBackupFile()
  if !exists("*strftime") | return | endif
  let fname = expand('%')
  if !filereadable(fname) || !filewritable(fname) | return | endif    " new file
  let backupDir = $HOME . '/.back/' . strftime("%Y-%m-%d") . '/'
  if !isdirectory(backupDir) | call mkdir(backupDir , 'p') | endif
  return writefile(readfile(fname),
        \ backupDir . expand('%:t') . '.' . localtime())
endfunction

command! MakeBackupFile call MakeBackupFile()

augroup makeBackupFile
  autocmd!
  autocmd BufWritePre * nested :MakeBackupFile
augroup END
