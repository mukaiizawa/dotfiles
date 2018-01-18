" backup

scriptencoding utf-8

let s:backupRootDir = $HOME . '/.back/'
let s:expired = 60 * 60 * 24 * 5

function! s:isBackupEnable()
  return exists('*strftime') && exists('*mkdir')
endfunction

function! MakeBackup()
  if !s:isBackupEnable() | return | endif
  let fname = expand('%')
  if !filereadable(fname) || !filewritable(fname) | return | endif    " new file
  let backupDir = s:backupRootDir . strftime('%Y-%m-%d') . '/'
  if !isdirectory(backupDir) | call mkdir(backupDir , 'p') | endif
  call writefile(readfile(fname, 'b'), backupDir . expand('%:t') . '.' .
        \ localtime(), 'b')
endfunction

function! RemoveBackup()
  if !s:isBackupEnable() | return | endif
  let now = localtime()
  let backupDirs = split(glob(s:backupRootDir . '*'), "\n")
  for backupDir in backupDirs
    if getftime(backupDir) < now - s:expired
      call delete(backupDir, 'rf')
    endif
  endfor
endfunction

command! MakeBackup call MakeBackup()
command! RemoveBackup call RemoveBackup()

augroup backup
  autocmd!
  autocmd BufWritePre * nested :MakeBackup
  autocmd VimLeave * nested :RemoveBackup
augroup END
