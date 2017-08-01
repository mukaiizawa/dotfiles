setlocal nocindent
setlocal lisp
setlocal shiftwidth=4
setlocal define=^\\s*(def\\k*
setlocal formatoptions-=t
setlocal iskeyword+=+,-,*,/,%,<,=,>,:,$,?,!,@-@,94
setlocal commentstring=;%s
setlocal comments^=:;;;,:;;,sr:#\|,mb:\|,ex:\|#

setlocal lispwords=let
setlocal lispwords+=def
setlocal lispwords+=fn
setlocal lispwords+=macro
