setlocal nocindent
setlocal lisp
setlocal define=^\\s*(\\(macro\\|lambda\\)
setlocal formatoptions-=t
setlocal iskeyword=35-38,42-43,45-58,60-63,65-91,93-95,97-125
setlocal commentstring=;%s
setlocal comments=:;
setlocal comments^=:;;,:;\:,:;;;,:;;;;
setlocal shiftwidth=4

setlocal lispwords=let
setlocal lispwords+=macro
setlocal lispwords+=lambda
setlocal lispwords+=try
setlocal lispwords+=catch
setlocal lispwords+=basic-try
setlocal lispwords+=basic-catch
setlocal lispwords+=finally

setlocal lispwords+=function
setlocal lispwords+=while
setlocal lispwords+=when
