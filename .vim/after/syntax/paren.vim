" paren.vim

if exists("b:current_syntax")
 finish
endif

sy sync minlines=1000
sy case match

sy region ParenList matchgroup=Delimiter start="(" end=")" contains=ALL
sy region ParenCommentReaderMacro matchgroup=Comment start="#;(" end=")" contains=ALL
sy region ParenQuoted matchgroup=Identifier start="'" end="[ \t();]" contains=ALL
sy region ParenQuoted matchgroup=Identifier start="'(" end=")" contains=ALL
sy region ParenQuoted matchgroup=Identifier start="`" end="[ \t();]" contains=ALL
sy region ParenQuoted matchgroup=Identifier start="`(" end=")" contains=ALL
sy match ParenNumber "\d"
sy region ParenString start='"' skip='\\.' end='"'
sy match ParenComment ";.*$" contains=ParenTodo
sy match ParenConstant "\<[A-Z_]\{1,}\>"
sy match ParenGlobal "\<\$\k*\>"
sy match ParenKeyword "\<:\k*\>"
sy match ParenBuiltIn "\[]"
sy keyword ParenSymbol nil true self
sy match ParenTodo "\c\<\(todo\|note\)\>" contained
sy match ParenError ")"

" automatic generated -- see make rw.vim {{{

sy keyword ParenBuiltIn -
sy keyword ParenBuiltIn --
sy keyword ParenBuiltIn ->list
sy keyword ParenBuiltIn !
sy keyword ParenBuiltIn !=
sy keyword ParenBuiltIn !==
sy keyword ParenBuiltIn %
sy keyword ParenBuiltIn &
sy keyword ParenBuiltIn &&
sy keyword ParenBuiltIn *
sy keyword ParenBuiltIn ..
sy keyword ParenBuiltIn /
sy keyword ParenBuiltIn //
sy keyword ParenBuiltIn ^
sy keyword ParenBuiltIn \|
sy keyword ParenBuiltIn \|\|
sy keyword ParenBuiltIn ~
sy keyword ParenBuiltIn +
sy keyword ParenBuiltIn ++
sy keyword ParenBuiltIn <
sy keyword ParenBuiltIn <-
sy keyword ParenBuiltIn <<
sy keyword ParenBuiltIn <=
sy keyword ParenBuiltIn =
sy keyword ParenBuiltIn ==
sy keyword ParenBuiltIn >
sy keyword ParenBuiltIn >=
sy keyword ParenBuiltIn >>
sy keyword ParenBuiltIn abs
sy keyword ParenBuiltIn acos
sy keyword ParenBuiltIn address
sy keyword ParenBuiltIn alnum?
sy keyword ParenBuiltIn alpha?
sy keyword ParenBuiltIn apply
sy keyword ParenBuiltIn array
sy keyword ParenBuiltIn array?
sy keyword ParenBuiltIn ascii?
sy keyword ParenBuiltIn asin
sy keyword ParenBuiltIn assert
sy keyword ParenBuiltIn assoc
sy keyword ParenBuiltIn atan
sy keyword ParenBuiltIn atom?
sy keyword ParenBuiltIn begin
sy keyword ParenBuiltIn begin0
sy keyword ParenBuiltIn bin
sy keyword ParenBuiltIn body
sy keyword ParenBuiltIn boot
sy keyword ParenBuiltIn bound?
sy keyword ParenBuiltIn break
sy keyword ParenBuiltIn built-in-function
sy keyword ParenBuiltIn built-in-name
sy keyword ParenBuiltIn built-in?
sy keyword ParenBuiltIn butlast
sy keyword ParenBuiltIn byte-len
sy keyword ParenBuiltIn byte?
sy keyword ParenBuiltIn bytes
sy keyword ParenBuiltIn bytes?
sy keyword ParenBuiltIn caaaar
sy keyword ParenBuiltIn caaadr
sy keyword ParenBuiltIn caaar
sy keyword ParenBuiltIn caadar
sy keyword ParenBuiltIn caaddr
sy keyword ParenBuiltIn caadr
sy keyword ParenBuiltIn caar
sy keyword ParenBuiltIn cadaar
sy keyword ParenBuiltIn cadadr
sy keyword ParenBuiltIn cadar
sy keyword ParenBuiltIn caddar
sy keyword ParenBuiltIn cadddr
sy keyword ParenBuiltIn caddr
sy keyword ParenBuiltIn cadr
sy keyword ParenBuiltIn car
sy keyword ParenBuiltIn car!
sy keyword ParenBuiltIn catch
sy keyword ParenBuiltIn cdaaar
sy keyword ParenBuiltIn cdaadr
sy keyword ParenBuiltIn cdaar
sy keyword ParenBuiltIn cdadar
sy keyword ParenBuiltIn cdaddr
sy keyword ParenBuiltIn cdadr
sy keyword ParenBuiltIn cdar
sy keyword ParenBuiltIn cddaar
sy keyword ParenBuiltIn cddadr
sy keyword ParenBuiltIn cddar
sy keyword ParenBuiltIn cdddar
sy keyword ParenBuiltIn cddddr
sy keyword ParenBuiltIn cdddr
sy keyword ParenBuiltIn cddr
sy keyword ParenBuiltIn cdr
sy keyword ParenBuiltIn cdr!
sy keyword ParenBuiltIn chdir
sy keyword ParenBuiltIn chr
sy keyword ParenBuiltIn chunk
sy keyword ParenBuiltIn class
sy keyword ParenBuiltIn clock
sy keyword ParenBuiltIn collect
sy keyword ParenBuiltIn complement
sy keyword ParenBuiltIn compose
sy keyword ParenBuiltIn concat
sy keyword ParenBuiltIn cons
sy keyword ParenBuiltIn cons?
sy keyword ParenBuiltIn continue
sy keyword ParenBuiltIn cos
sy keyword ParenBuiltIn cosh
sy keyword ParenBuiltIn count
sy keyword ParenBuiltIn cycle
sy keyword ParenBuiltIn dict
sy keyword ParenBuiltIn dict?
sy keyword ParenBuiltIn difference
sy keyword ParenBuiltIn digit?
sy keyword ParenBuiltIn doarray
sy keyword ParenBuiltIn dolist
sy keyword ParenBuiltIn dostring
sy keyword ParenBuiltIn dotimes
sy keyword ParenBuiltIn drop
sy keyword ParenBuiltIn drop-last
sy keyword ParenBuiltIn drop-while
sy keyword ParenBuiltIn dynamic
sy keyword ParenBuiltIn empty?
sy keyword ParenBuiltIn eval
sy keyword ParenBuiltIn even?
sy keyword ParenBuiltIn every-adjacent?
sy keyword ParenBuiltIn every?
sy keyword ParenBuiltIn exit
sy keyword ParenBuiltIn exp
sy keyword ParenBuiltIn f
sy keyword ParenBuiltIn fclose
sy keyword ParenBuiltIn fgetc
sy keyword ParenBuiltIn fgets
sy keyword ParenBuiltIn fill!
sy keyword ParenBuiltIn find-class
sy keyword ParenBuiltIn find-method
sy keyword ParenBuiltIn flatten
sy keyword ParenBuiltIn float
sy keyword ParenBuiltIn fopen
sy keyword ParenBuiltIn for
sy keyword ParenBuiltIn foreach
sy keyword ParenBuiltIn format
sy keyword ParenBuiltIn fp
sy keyword ParenBuiltIn fputc
sy keyword ParenBuiltIn fread
sy keyword ParenBuiltIn fseek
sy keyword ParenBuiltIn ftell
sy keyword ParenBuiltIn function
sy keyword ParenBuiltIn function!
sy keyword ParenBuiltIn function?
sy keyword ParenBuiltIn fwrite
sy keyword ParenBuiltIn getcwd
sy keyword ParenBuiltIn getenv
sy keyword ParenBuiltIn group
sy keyword ParenBuiltIn group-by
sy keyword ParenBuiltIn hash
sy keyword ParenBuiltIn hex
sy keyword ParenBuiltIn identity
sy keyword ParenBuiltIn if
sy keyword ParenBuiltIn import
sy keyword ParenBuiltIn in?
sy keyword ParenBuiltIn index
sy keyword ParenBuiltIn int
sy keyword ParenBuiltIn int?
sy keyword ParenBuiltIn int32
sy keyword ParenBuiltIn intersection
sy keyword ParenBuiltIn is-a?
sy keyword ParenBuiltIn join
sy keyword ParenBuiltIn juxt
sy keyword ParenBuiltIn keep
sy keyword ParenBuiltIn keep1
sy keyword ParenBuiltIn keys
sy keyword ParenBuiltIn keyword
sy keyword ParenBuiltIn keyword?
sy keyword ParenBuiltIn last
sy keyword ParenBuiltIn last-cons
sy keyword ParenBuiltIn last-index
sy keyword ParenBuiltIn len
sy keyword ParenBuiltIn let
sy keyword ParenBuiltIn list
sy keyword ParenBuiltIn list...
sy keyword ParenBuiltIn list?
sy keyword ParenBuiltIn load
sy keyword ParenBuiltIn log
sy keyword ParenBuiltIn loop
sy keyword ParenBuiltIn lower
sy keyword ParenBuiltIn lower?
sy keyword ParenBuiltIn ltrim
sy keyword ParenBuiltIn macro
sy keyword ParenBuiltIn macro?
sy keyword ParenBuiltIn macroexpand
sy keyword ParenBuiltIn macroexpand-1
sy keyword ParenBuiltIn map
sy keyword ParenBuiltIn map-group
sy keyword ParenBuiltIn max
sy keyword ParenBuiltIn member
sy keyword ParenBuiltIn memcmp
sy keyword ParenBuiltIn memcpy
sy keyword ParenBuiltIn method
sy keyword ParenBuiltIn min
sy keyword ParenBuiltIn mkdir
sy keyword ParenBuiltIn neg?
sy keyword ParenBuiltIn nil?
sy keyword ParenBuiltIn none?
sy keyword ParenBuiltIn number?
sy keyword ParenBuiltIn object?
sy keyword ParenBuiltIn oct
sy keyword ParenBuiltIn odd?
sy keyword ParenBuiltIn ord
sy keyword ParenBuiltIn params
sy keyword ParenBuiltIn partial
sy keyword ParenBuiltIn path
sy keyword ParenBuiltIn pclose
sy keyword ParenBuiltIn pop!
sy keyword ParenBuiltIn popen
sy keyword ParenBuiltIn pos?
sy keyword ParenBuiltIn position
sy keyword ParenBuiltIn pow
sy keyword ParenBuiltIn prefix?
sy keyword ParenBuiltIn print
sy keyword ParenBuiltIn print?
sy keyword ParenBuiltIn printf
sy keyword ParenBuiltIn println
sy keyword ParenBuiltIn product
sy keyword ParenBuiltIn push!
sy keyword ParenBuiltIn putenv
sy keyword ParenBuiltIn quasiquote
sy keyword ParenBuiltIn quit
sy keyword ParenBuiltIn quote
sy keyword ParenBuiltIn raise
sy keyword ParenBuiltIn read
sy keyword ParenBuiltIn read-byte
sy keyword ParenBuiltIn read-bytes
sy keyword ParenBuiltIn read-char
sy keyword ParenBuiltIn read-line
sy keyword ParenBuiltIn readdir
sy keyword ParenBuiltIn reader-macro
sy keyword ParenBuiltIn reduce
sy keyword ParenBuiltIn reject
sy keyword ParenBuiltIn remove
sy keyword ParenBuiltIn rename
sy keyword ParenBuiltIn repeat
sy keyword ParenBuiltIn repl
sy keyword ParenBuiltIn return
sy keyword ParenBuiltIn reverse
sy keyword ParenBuiltIn reverse!
sy keyword ParenBuiltIn rtrim
sy keyword ParenBuiltIn select
sy keyword ParenBuiltIn select1
sy keyword ParenBuiltIn sin
sy keyword ParenBuiltIn sinh
sy keyword ParenBuiltIn sleep
sy keyword ParenBuiltIn slice
sy keyword ParenBuiltIn some?
sy keyword ParenBuiltIn sort!
sy keyword ParenBuiltIn space?
sy keyword ParenBuiltIn special-operator
sy keyword ParenBuiltIn special-operator?
sy keyword ParenBuiltIn split
sy keyword ParenBuiltIn split-at
sy keyword ParenBuiltIn split-with
sy keyword ParenBuiltIn sqrt
sy keyword ParenBuiltIn stat
sy keyword ParenBuiltIn str
sy keyword ParenBuiltIn string
sy keyword ParenBuiltIn string!
sy keyword ParenBuiltIn string?
sy keyword ParenBuiltIn suffix?
sy keyword ParenBuiltIn swap!
sy keyword ParenBuiltIn symbol
sy keyword ParenBuiltIn symbol?
sy keyword ParenBuiltIn symmetric-difference
sy keyword ParenBuiltIn system
sy keyword ParenBuiltIn take
sy keyword ParenBuiltIn take-last
sy keyword ParenBuiltIn take-while
sy keyword ParenBuiltIn tan
sy keyword ParenBuiltIn tanh
sy keyword ParenBuiltIn throw
sy keyword ParenBuiltIn time
sy keyword ParenBuiltIn timeit
sy keyword ParenBuiltIn title
sy keyword ParenBuiltIn title?
sy keyword ParenBuiltIn trim
sy keyword ParenBuiltIn union
sy keyword ParenBuiltIn uniq
sy keyword ParenBuiltIn unquote
sy keyword ParenBuiltIn unquote-splicing
sy keyword ParenBuiltIn unwind-protect
sy keyword ParenBuiltIn upper
sy keyword ParenBuiltIn upper?
sy keyword ParenBuiltIn utcoffset
sy keyword ParenBuiltIn utime
sy keyword ParenBuiltIn vals
sy keyword ParenBuiltIn wcwidth
sy keyword ParenBuiltIn when
sy keyword ParenBuiltIn while
sy keyword ParenBuiltIn with-arrow-syntax
sy keyword ParenBuiltIn with-gensyms
sy keyword ParenBuiltIn with-memory-stream
sy keyword ParenBuiltIn with-open
sy keyword ParenBuiltIn with-process
sy keyword ParenBuiltIn write
sy keyword ParenBuiltIn write-byte
sy keyword ParenBuiltIn write-bytes
sy keyword ParenBuiltIn write-line
sy keyword ParenBuiltIn zero?
sy keyword ParenBuiltIn zip

" }}}

sy match ParenMethod "\<\.\k*\>"
sy match ParenClass "\<:\u\k*\>"
sy match ParenInstansAccesser "\<&\k*\>"

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
