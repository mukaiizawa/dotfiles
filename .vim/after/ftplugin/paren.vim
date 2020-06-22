" paren.vim

setlocal nocindent
setlocal lisp
setlocal define=^\\s*(\\(macro\\|lambda\\)
setlocal formatoptions-=t
setlocal iskeyword=33,35-38,42-43,45-58,60-63,65-91,93-95,97-125
setlocal commentstring=;%s
setlocal comments=:;
setlocal comments^=:;;,:;\:,:;;;,:;;;;
setlocal colorcolumn=100
setlocal shiftwidth=4

" special operator
setlocal lispwords=let
setlocal lispwords+=macro
setlocal lispwords+=lambda
setlocal lispwords+=try
setlocal lispwords+=catch
setlocal lispwords+=basic-catch

" macro
setlocal lispwords+=builtin-function
setlocal lispwords+=dolist
setlocal lispwords+=dotimes
setlocal lispwords+=for
setlocal lispwords+=function
setlocal lispwords+=function!
setlocal lispwords+=global-symbol
setlocal lispwords+=special-operator
setlocal lispwords+=unless
setlocal lispwords+=when
setlocal lispwords+=while
setlocal lispwords+=with
setlocal lispwords+=with-gensyms
setlocal lispwords+=with-memory-stream
setlocal lispwords+=with-open-append
setlocal lispwords+=with-open-read
setlocal lispwords+=with-open-update
setlocal lispwords+=with-open-write

" paren object system
setlocal lispwords+=class
setlocal lispwords+=method
