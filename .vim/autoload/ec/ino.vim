" editor commands inor map.

function! ec#ino#ctrl_d()
  execute ":normal a" . strftime("%Y-%m-%d")
endfunction
