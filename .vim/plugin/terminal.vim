vim9script

augroup terminal_window
  autocmd!
  autocmd TerminalWinOpen * setlocal nonumber
augroup END
