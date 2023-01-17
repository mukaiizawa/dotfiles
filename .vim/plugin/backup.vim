" backup.vim

let s:backupRootDir = $HOME . '/.back/'
let s:expired = 60 * 60 * 24 * 8

fu! s:isBackupEnable()
  retu exists('*strftime') && exists('*mkdir')
endf

fu! MakeBackup()
  if !s:isBackupEnable() | return | en
  let fname = expand('%')
  if !filereadable(fname) || !filewritable(fname) | return | en    " new file
  let backupDir = s:backupRootDir . strftime('%Y-%m-%d') . '/'
  if !isdirectory(backupDir) | call mkdir(backupDir , 'p') | en
  call writefile(readfile(fname, 'b'), backupDir . expand('%:t') . '.' .
        \ localtime(), 'b')
endf

fu! RemoveBackup()
  if !s:isBackupEnable() | return | en
  let now = localtime()
  let backupDirs = split(glob(s:backupRootDir . '*'), "\n")
  for backupDir in backupDirs
    if getftime(backupDir) < now - s:expired
      call delete(backupDir, 'rf')
    en
  endfo
endf

com! MakeBackup call MakeBackup()
com! RemoveBackup call RemoveBackup()

aug backup
  au!
  au BufWritePre * nested :MakeBackup
  au VimLeave * nested :RemoveBackup
aug END
