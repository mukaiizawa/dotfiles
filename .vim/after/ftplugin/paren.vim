" paren.vim

setl cpt=s~/dotfiles/word/paren.word,.,b,u
setl nocin
setl lisp
setl def=^\\s*(\\(macro\\|f\\|function\\|class\\|method\\)
setl fo-=t
setl isk=33,35-38,42-43,45-58,60-63,65-91,93-95,97-126
setl com=:;;;;;;,:;;;;;,:;;;;,:;;;,:;;,:;
setl cms=;%s
setl sw=4

" special operator
setl lw=let
setl lw+=catch
setl lw+=f
setl lw+=macro

" macro
setl lw+=built-in-function
setl lw+=class
setl lw+=doarray
setl lw+=dolist
setl lw+=dostring
setl lw+=dotimes
setl lw+=for
setl lw+=function
setl lw+=function!
setl lw+=method
setl lw+=reader-macro
setl lw+=special-operator
setl lw+=when
setl lw+=while
setl lw+=with-client-socket
setl lw+=with-gensyms
setl lw+=with-memory-stream
setl lw+=with-open
setl lw+=with-process
setl lw+=with-server-socket
