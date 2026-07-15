vim9script

g:unite_mappings = {
  prompt_redo: 'U',
}

unite#Register('line', {
  source: function('unite#line#GatherCandidates'),
  action: function('unite#action#Open'),
  syntax: 'line-numbers',
})
unite#Register('file', {
  source: function('unite#file#GatherCandidates'),
  action: function('unite#action#Open'),
})
unite#Register('dir', {
  source: function('unite#file#GatherDirectoryCandidates'),
  action: function('unite#action#Open'),
})
unite#Register('yank', {
  source: function('unite#yank#GatherCandidates'),
  action: function('unite#action#SetReg'),
})
unite#Register('quickfix', {
  source: function('unite#quickfix#GatherCandidates'),
  action: function('unite#action#Open'),
})
unite#Register('repo', {
  source: function('unite#file#GatherRepositoryCandidates'),
  action: function('unite#action#Open'),
})
unite#Register('menu', {
  source: function('unite#menu#GatherCandidates'),
  action: function('unite#action#Execute'),
})
unite#Register('help', {
  source: function('unite#help#GatherCandidates'),
  action: function('unite#action#Open'),
})

def TrackFileBuffer()
  if bufnr('%') != str2nr(expand('<abuf>')) || empty(expand('<amatch>'))
    return
  endif
  unite#file#AppendCurrentBuffer()
enddef

augroup unite_file
  autocmd!
  autocmd BufEnter * call TrackFileBuffer()
  autocmd VimLeavePre * call unite#file#Save({event: 'VimLeavePre'})
augroup END

augroup unite_yank
  autocmd!
  if exists('##TextYankPost')
    autocmd FocusGained,FocusLost * silent call unite#yank#Append()
    autocmd TextYankPost * silent call unite#yank#YankPost()
  else
    autocmd CursorMoved,FocusGained,FocusLost,VimLeavePre * silent call unite#yank#Append()
    autocmd TextChanged * silent call unite#yank#Append()
  endif
augroup END
