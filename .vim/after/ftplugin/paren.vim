" paren.vim

setlocal nocindent
setlocal lisp
setlocal define=^\\s*(\\(macro\\|f\\|function\\|class\\|method\\)
setlocal formatoptions-=t
setlocal iskeyword=33,35-38,42-43,45-58,60-63,65-91,93-95,97-126
setlocal comments=:;
setlocal comments^=:;;;,:;;,sr:#;,mb:;,ex:;#
setlocal commentstring=;%s
setlocal colorcolumn=100
setlocal shiftwidth=4

" special operator
setlocal lispwords=let
setlocal lispwords+=catch
setlocal lispwords+=f
setlocal lispwords+=macro

" macro
setlocal lispwords+=&<-
setlocal lispwords+=built-in-function
setlocal lispwords+=class
setlocal lispwords+=doarray
setlocal lispwords+=dolist
setlocal lispwords+=dostring
setlocal lispwords+=dotimes
setlocal lispwords+=for
setlocal lispwords+=function
setlocal lispwords+=function!
setlocal lispwords+=method
setlocal lispwords+=reader-macro
setlocal lispwords+=special-operator
setlocal lispwords+=switch
setlocal lispwords+=when
setlocal lispwords+=while
setlocal lispwords+=with-client-socket
setlocal lispwords+=with-gensyms
setlocal lispwords+=with-memory-stream
setlocal lispwords+=with-open
setlocal lispwords+=with-server-socket
