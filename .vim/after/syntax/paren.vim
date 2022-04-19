if exists("b:current_syntax")
 finish
endif

syn sync minlines=1000
syn case match

syn region ParenList matchgroup=Delimiter start="(" end=")" contains=ALL
syn region ParenCommentReaderMacro matchgroup=Comment start="#;(" end=")" contains=ALL
syn region ParenQuoted matchgroup=Identifier start="'" end="[ \t();]" contains=ALL
syn region ParenQuoted matchgroup=Identifier start="'(" end=")" contains=ALL
syn region ParenQuoted matchgroup=Identifier start="`" end="[ \t();]" contains=ALL
syn region ParenQuoted matchgroup=Identifier start="`(" end=")" contains=ALL
syn match ParenNumber "\d"
syn region ParenString start='"' skip='\\.' end='"'
syn match ParenComment ";.*$" contains=ParenTodo
syn match ParenConstant "\<[A-Z_]\{1,}\>"
syn match ParenGlobal "\<\$\k*\>"
syn match ParenKeyword "\<:\k*\>"
syn match ParenBuiltIn "\[]"
syn keyword ParenSymbol nil true self
syn match ParenTodo "\c\<\(todo\|note\)\>" contained
syn match ParenError ")"

" automatic generated -- see make rw.vim {{{

syn keyword ParenBuiltIn -
syn keyword ParenBuiltIn --
syn keyword ParenBuiltIn ->list
syn keyword ParenBuiltIn !
syn keyword ParenBuiltIn !=
syn keyword ParenBuiltIn !==
syn keyword ParenBuiltIn %
syn keyword ParenBuiltIn &
syn keyword ParenBuiltIn &&
syn keyword ParenBuiltIn *
syn keyword ParenBuiltIn ..
syn keyword ParenBuiltIn /
syn keyword ParenBuiltIn //
syn keyword ParenBuiltIn ^
syn keyword ParenBuiltIn \|
syn keyword ParenBuiltIn \|\|
syn keyword ParenBuiltIn ~
syn keyword ParenBuiltIn +
syn keyword ParenBuiltIn ++
syn keyword ParenBuiltIn <
syn keyword ParenBuiltIn <-
syn keyword ParenBuiltIn <<
syn keyword ParenBuiltIn <=
syn keyword ParenBuiltIn =
syn keyword ParenBuiltIn ==
syn keyword ParenBuiltIn >
syn keyword ParenBuiltIn >=
syn keyword ParenBuiltIn >>
syn keyword ParenBuiltIn abs
syn keyword ParenBuiltIn acos
syn keyword ParenBuiltIn address
syn keyword ParenBuiltIn alnum?
syn keyword ParenBuiltIn alpha?
syn keyword ParenBuiltIn apply
syn keyword ParenBuiltIn array
syn keyword ParenBuiltIn array?
syn keyword ParenBuiltIn ascii?
syn keyword ParenBuiltIn asin
syn keyword ParenBuiltIn assert
syn keyword ParenBuiltIn assoc
syn keyword ParenBuiltIn atan
syn keyword ParenBuiltIn atom?
syn keyword ParenBuiltIn begin
syn keyword ParenBuiltIn begin0
syn keyword ParenBuiltIn bin
syn keyword ParenBuiltIn body
syn keyword ParenBuiltIn boot
syn keyword ParenBuiltIn bound?
syn keyword ParenBuiltIn break
syn keyword ParenBuiltIn built-in-function
syn keyword ParenBuiltIn built-in-name
syn keyword ParenBuiltIn built-in?
syn keyword ParenBuiltIn butlast
syn keyword ParenBuiltIn byte-len
syn keyword ParenBuiltIn byte?
syn keyword ParenBuiltIn bytes
syn keyword ParenBuiltIn bytes?
syn keyword ParenBuiltIn caaaar
syn keyword ParenBuiltIn caaadr
syn keyword ParenBuiltIn caaar
syn keyword ParenBuiltIn caadar
syn keyword ParenBuiltIn caaddr
syn keyword ParenBuiltIn caadr
syn keyword ParenBuiltIn caar
syn keyword ParenBuiltIn cadaar
syn keyword ParenBuiltIn cadadr
syn keyword ParenBuiltIn cadar
syn keyword ParenBuiltIn caddar
syn keyword ParenBuiltIn cadddr
syn keyword ParenBuiltIn caddr
syn keyword ParenBuiltIn cadr
syn keyword ParenBuiltIn car
syn keyword ParenBuiltIn car!
syn keyword ParenBuiltIn catch
syn keyword ParenBuiltIn cdaaar
syn keyword ParenBuiltIn cdaadr
syn keyword ParenBuiltIn cdaar
syn keyword ParenBuiltIn cdadar
syn keyword ParenBuiltIn cdaddr
syn keyword ParenBuiltIn cdadr
syn keyword ParenBuiltIn cdar
syn keyword ParenBuiltIn cddaar
syn keyword ParenBuiltIn cddadr
syn keyword ParenBuiltIn cddar
syn keyword ParenBuiltIn cdddar
syn keyword ParenBuiltIn cddddr
syn keyword ParenBuiltIn cdddr
syn keyword ParenBuiltIn cddr
syn keyword ParenBuiltIn cdr
syn keyword ParenBuiltIn cdr!
syn keyword ParenBuiltIn chdir
syn keyword ParenBuiltIn chr
syn keyword ParenBuiltIn chunk
syn keyword ParenBuiltIn class
syn keyword ParenBuiltIn clock
syn keyword ParenBuiltIn collect
syn keyword ParenBuiltIn complement
syn keyword ParenBuiltIn compose
syn keyword ParenBuiltIn concat
syn keyword ParenBuiltIn cons
syn keyword ParenBuiltIn cons?
syn keyword ParenBuiltIn continue
syn keyword ParenBuiltIn cos
syn keyword ParenBuiltIn cosh
syn keyword ParenBuiltIn count
syn keyword ParenBuiltIn cycle
syn keyword ParenBuiltIn dict
syn keyword ParenBuiltIn dict?
syn keyword ParenBuiltIn difference
syn keyword ParenBuiltIn digit?
syn keyword ParenBuiltIn doarray
syn keyword ParenBuiltIn dolist
syn keyword ParenBuiltIn dostring
syn keyword ParenBuiltIn dotimes
syn keyword ParenBuiltIn drop
syn keyword ParenBuiltIn drop-last
syn keyword ParenBuiltIn drop-while
syn keyword ParenBuiltIn dynamic
syn keyword ParenBuiltIn empty?
syn keyword ParenBuiltIn eval
syn keyword ParenBuiltIn even?
syn keyword ParenBuiltIn every-adjacent?
syn keyword ParenBuiltIn every?
syn keyword ParenBuiltIn exit
syn keyword ParenBuiltIn exp
syn keyword ParenBuiltIn f
syn keyword ParenBuiltIn fclose
syn keyword ParenBuiltIn fgetc
syn keyword ParenBuiltIn fgets
syn keyword ParenBuiltIn find-class
syn keyword ParenBuiltIn find-method
syn keyword ParenBuiltIn flatten
syn keyword ParenBuiltIn float
syn keyword ParenBuiltIn fopen
syn keyword ParenBuiltIn for
syn keyword ParenBuiltIn foreach
syn keyword ParenBuiltIn format
syn keyword ParenBuiltIn fp
syn keyword ParenBuiltIn fputc
syn keyword ParenBuiltIn fread
syn keyword ParenBuiltIn fseek
syn keyword ParenBuiltIn ftell
syn keyword ParenBuiltIn function
syn keyword ParenBuiltIn function!
syn keyword ParenBuiltIn function?
syn keyword ParenBuiltIn fwrite
syn keyword ParenBuiltIn getcwd
syn keyword ParenBuiltIn getenv
syn keyword ParenBuiltIn group
syn keyword ParenBuiltIn group-by
syn keyword ParenBuiltIn hash
syn keyword ParenBuiltIn hex
syn keyword ParenBuiltIn identity
syn keyword ParenBuiltIn if
syn keyword ParenBuiltIn import
syn keyword ParenBuiltIn in?
syn keyword ParenBuiltIn index
syn keyword ParenBuiltIn int
syn keyword ParenBuiltIn int?
syn keyword ParenBuiltIn int32
syn keyword ParenBuiltIn intersection
syn keyword ParenBuiltIn is-a?
syn keyword ParenBuiltIn join
syn keyword ParenBuiltIn juxt
syn keyword ParenBuiltIn keep
syn keyword ParenBuiltIn keep1
syn keyword ParenBuiltIn keys
syn keyword ParenBuiltIn keyword
syn keyword ParenBuiltIn keyword?
syn keyword ParenBuiltIn last
syn keyword ParenBuiltIn last-cons
syn keyword ParenBuiltIn last-index
syn keyword ParenBuiltIn len
syn keyword ParenBuiltIn let
syn keyword ParenBuiltIn list
syn keyword ParenBuiltIn list...
syn keyword ParenBuiltIn list?
syn keyword ParenBuiltIn load
syn keyword ParenBuiltIn log
syn keyword ParenBuiltIn loop
syn keyword ParenBuiltIn lower
syn keyword ParenBuiltIn lower?
syn keyword ParenBuiltIn lstrip
syn keyword ParenBuiltIn macro
syn keyword ParenBuiltIn macro?
syn keyword ParenBuiltIn macroexpand
syn keyword ParenBuiltIn macroexpand-1
syn keyword ParenBuiltIn make-accessor
syn keyword ParenBuiltIn make-method-dispatcher
syn keyword ParenBuiltIn map
syn keyword ParenBuiltIn max
syn keyword ParenBuiltIn member
syn keyword ParenBuiltIn memcmp
syn keyword ParenBuiltIn memcpy
syn keyword ParenBuiltIn method
syn keyword ParenBuiltIn min
syn keyword ParenBuiltIn mkdir
syn keyword ParenBuiltIn neg?
syn keyword ParenBuiltIn nil?
syn keyword ParenBuiltIn none?
syn keyword ParenBuiltIn number?
syn keyword ParenBuiltIn object?
syn keyword ParenBuiltIn oct
syn keyword ParenBuiltIn odd?
syn keyword ParenBuiltIn ord
syn keyword ParenBuiltIn overload
syn keyword ParenBuiltIn params
syn keyword ParenBuiltIn partial
syn keyword ParenBuiltIn path
syn keyword ParenBuiltIn path.getcwd
syn keyword ParenBuiltIn pclose
syn keyword ParenBuiltIn pop!
syn keyword ParenBuiltIn popen
syn keyword ParenBuiltIn pos?
syn keyword ParenBuiltIn position
syn keyword ParenBuiltIn pow
syn keyword ParenBuiltIn prefix?
syn keyword ParenBuiltIn print
syn keyword ParenBuiltIn print?
syn keyword ParenBuiltIn println
syn keyword ParenBuiltIn product
syn keyword ParenBuiltIn push!
syn keyword ParenBuiltIn putenv
syn keyword ParenBuiltIn quasiquote
syn keyword ParenBuiltIn quit
syn keyword ParenBuiltIn quote
syn keyword ParenBuiltIn raise
syn keyword ParenBuiltIn read
syn keyword ParenBuiltIn read-byte
syn keyword ParenBuiltIn read-bytes
syn keyword ParenBuiltIn read-char
syn keyword ParenBuiltIn read-line
syn keyword ParenBuiltIn readdir
syn keyword ParenBuiltIn reader-macro
syn keyword ParenBuiltIn reduce
syn keyword ParenBuiltIn reject
syn keyword ParenBuiltIn remove
syn keyword ParenBuiltIn rename
syn keyword ParenBuiltIn repl
syn keyword ParenBuiltIn return
syn keyword ParenBuiltIn reverse
syn keyword ParenBuiltIn reverse!
syn keyword ParenBuiltIn rstrip
syn keyword ParenBuiltIn select
syn keyword ParenBuiltIn select1
syn keyword ParenBuiltIn sin
syn keyword ParenBuiltIn sinh
syn keyword ParenBuiltIn sleep
syn keyword ParenBuiltIn slice
syn keyword ParenBuiltIn some?
syn keyword ParenBuiltIn sort!
syn keyword ParenBuiltIn space?
syn keyword ParenBuiltIn special-operator
syn keyword ParenBuiltIn special-operator?
syn keyword ParenBuiltIn split
syn keyword ParenBuiltIn split-at
syn keyword ParenBuiltIn split-with
syn keyword ParenBuiltIn sqrt
syn keyword ParenBuiltIn stat
syn keyword ParenBuiltIn str
syn keyword ParenBuiltIn string
syn keyword ParenBuiltIn string!
syn keyword ParenBuiltIn string?
syn keyword ParenBuiltIn strip
syn keyword ParenBuiltIn suffix?
syn keyword ParenBuiltIn swap!
syn keyword ParenBuiltIn symbol
syn keyword ParenBuiltIn symbol?
syn keyword ParenBuiltIn symcmp
syn keyword ParenBuiltIn symmetric-difference
syn keyword ParenBuiltIn system
syn keyword ParenBuiltIn take
syn keyword ParenBuiltIn take-last
syn keyword ParenBuiltIn take-while
syn keyword ParenBuiltIn tan
syn keyword ParenBuiltIn tanh
syn keyword ParenBuiltIn throw
syn keyword ParenBuiltIn time
syn keyword ParenBuiltIn timeit
syn keyword ParenBuiltIn title
syn keyword ParenBuiltIn title?
syn keyword ParenBuiltIn union
syn keyword ParenBuiltIn uniq
syn keyword ParenBuiltIn unquote
syn keyword ParenBuiltIn unquote-splicing
syn keyword ParenBuiltIn unwind-protect
syn keyword ParenBuiltIn upper
syn keyword ParenBuiltIn upper?
syn keyword ParenBuiltIn utcoffset
syn keyword ParenBuiltIn utime
syn keyword ParenBuiltIn vals
syn keyword ParenBuiltIn wcwidth
syn keyword ParenBuiltIn when
syn keyword ParenBuiltIn while
syn keyword ParenBuiltIn with-gensyms
syn keyword ParenBuiltIn with-memory-stream
syn keyword ParenBuiltIn with-open
syn keyword ParenBuiltIn with-process
syn keyword ParenBuiltIn write
syn keyword ParenBuiltIn write-byte
syn keyword ParenBuiltIn write-bytes
syn keyword ParenBuiltIn write-line
syn keyword ParenBuiltIn zero?
syn keyword ParenBuiltIn zip

" }}}

syn match ParenMethod "\<\.\k*\>"
syn match ParenClass "\<:\u\k*\>"
syn match ParenInstansAccesser "\<&\k*\>"

hi def link ParenComment Comment
hi def link ParenBlockComment Comment
hi def link ParenString String
hi def link ParenNumber Number
hi def link ParenSymbol Identifier
hi def link ParenBuiltIn Statement
hi def link ParenConstant Constant
hi def link ParenGlobal Identifier
hi def link ParenKeyword Identifier
hi def link ParenTodo ToDo
hi def link ParenClass Type
hi def link ParenMethod Function
hi def link ParenInstansAccesser Function
hi def link ParenError Error

let b:current_syntax = "paren"
