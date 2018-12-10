setlocal nocindent
setlocal lisp
setlocal define=^\\s*(\\(macro\\|lambda\\)
setlocal formatoptions-=t
setlocal iskeyword+=+,-,*,/,%,<,=,>,:,$,?,!,@-@,94
setlocal commentstring=;%s
setlocal comments=:;
setlocal comments^=:;;,:;\:,:;;;,:;;;;

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
