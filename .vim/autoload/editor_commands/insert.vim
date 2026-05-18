vim9script

export def CtrlD()
  execute 'normal! a' .. strftime('%Y-%m-%d')
enddef
