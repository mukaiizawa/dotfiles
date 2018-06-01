setlocal nocindent
setlocal lisp
setlocal shiftwidth=4
setlocal define=^\\s*(\\(macro\\|lambda\\)
setlocal formatoptions-=t
setlocal iskeyword+=+,-,*,/,%,<,=,>,:,$,?,!,@-@,94
setlocal commentstring=;%s
setlocal comments^=:;;;,:;;,sr:#\|,mb:\|,ex:\|#

setlocal lispwords=let
setlocal lispwords+=macro
setlocal lispwords+=lambda
setlocal lispwords+=function
