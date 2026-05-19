vim9script

var backupRootDir = $HOME .. '/.back/'
var expired = 60 * 60 * 24 * 8

def IsBackupEnable(): bool
  return exists('*strftime') && exists('*mkdir')
enddef

def MakeBackup()
  if !IsBackupEnable()
    return
  endif
  var fname = expand('%')
  if !filereadable(fname) || !filewritable(fname)
    return
  endif
  var backupDir = backupRootDir .. strftime('%Y-%m-%d') .. '/'
  if !isdirectory(backupDir)
    mkdir(backupDir, 'p')
  endif
  writefile(
    readfile(fname, 'b'),
    backupDir .. expand('%:t') .. '.' .. localtime(),
    'b'
  )
enddef

def RemoveBackup()
  if !IsBackupEnable()
    return
  endif
  var now = localtime()
  var backupDirs = split(glob(backupRootDir .. '*'), "\n")
  for backupDir in backupDirs
    if getftime(backupDir) < now - expired
      delete(backupDir, 'rf')
    endif
  endfor
enddef

command! MakeBackup call <SID>MakeBackup()
command! RemoveBackup call <SID>RemoveBackup()

augroup backup
  autocmd!
  autocmd BufWritePre * MakeBackup
  autocmd VimLeave * RemoveBackup
augroup END
