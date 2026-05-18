" paren.vim

if exists("b:current_syntax")
 finish
endif

syntax sync minlines=1000
syntax case match

syntax region ParenList matchgroup=Delimiter start="(" end=")" contains=ALL
syntax region ParenCommentReaderMacro matchgroup=Comment start="#;(" end=")" contains=ALL
syntax region ParenQuoted matchgroup=Identifier start="'" end="[ \t();]" contains=ALL
syntax region ParenQuoted matchgroup=Identifier start="'(" end=")" contains=ALL
syntax region ParenQuoted matchgroup=Identifier start="`" end="[ \t();]" contains=ALL
syntax region ParenQuoted matchgroup=Identifier start="`(" end=")" contains=ALL
syntax match ParenNumber "\d"
syntax region ParenString start='"' skip='\\.' end='"'
syntax match ParenComment ";.*$" contains=ParenTodo
syntax match ParenConstant "\<[A-Z_]\{1,}\>"
syntax match ParenGlobal "\<\$\k*\>"
syntax match ParenKeyword "\<:\k*\>"
syntax match ParenBuiltIn "\[]"
syntax keyword ParenSymbol nil true self
syntax match ParenTodo "\c\<\(todo\|note\)\>" contained
syntax match ParenError ")"

" automatic generated -- see make rw.vim {{{

syntax keyword ParenBuiltIn -
syntax keyword ParenBuiltIn --
syntax keyword ParenBuiltIn ->list
syntax keyword ParenBuiltIn !
syntax keyword ParenBuiltIn !=
syntax keyword ParenBuiltIn !==
syntax keyword ParenBuiltIn %
syntax keyword ParenBuiltIn &
syntax keyword ParenBuiltIn &&
syntax keyword ParenBuiltIn *
syntax keyword ParenBuiltIn ..
syntax keyword ParenBuiltIn /
syntax keyword ParenBuiltIn //
syntax keyword ParenBuiltIn ^
syntax keyword ParenBuiltIn \|
syntax keyword ParenBuiltIn \|\|
syntax keyword ParenBuiltIn ~
syntax keyword ParenBuiltIn +
syntax keyword ParenBuiltIn ++
syntax keyword ParenBuiltIn <
syntax keyword ParenBuiltIn <-
syntax keyword ParenBuiltIn <<
syntax keyword ParenBuiltIn <=
syntax keyword ParenBuiltIn =
syntax keyword ParenBuiltIn ==
syntax keyword ParenBuiltIn >
syntax keyword ParenBuiltIn >=
syntax keyword ParenBuiltIn >>
syntax keyword ParenBuiltIn abs
syntax keyword ParenBuiltIn acos
syntax keyword ParenBuiltIn address
syntax keyword ParenBuiltIn alnum?
syntax keyword ParenBuiltIn alpha?
syntax keyword ParenBuiltIn apply
syntax keyword ParenBuiltIn array
syntax keyword ParenBuiltIn array?
syntax keyword ParenBuiltIn ascii?
syntax keyword ParenBuiltIn asin
syntax keyword ParenBuiltIn assert
syntax keyword ParenBuiltIn assoc
syntax keyword ParenBuiltIn atan
syntax keyword ParenBuiltIn atom?
syntax keyword ParenBuiltIn begin
syntax keyword ParenBuiltIn begin0
syntax keyword ParenBuiltIn bin
syntax keyword ParenBuiltIn body
syntax keyword ParenBuiltIn boot
syntax keyword ParenBuiltIn bound?
syntax keyword ParenBuiltIn break
syntax keyword ParenBuiltIn built-in-function
syntax keyword ParenBuiltIn built-in-name
syntax keyword ParenBuiltIn built-in?
syntax keyword ParenBuiltIn butlast
syntax keyword ParenBuiltIn byte-len
syntax keyword ParenBuiltIn byte?
syntax keyword ParenBuiltIn bytes
syntax keyword ParenBuiltIn bytes?
syntax keyword ParenBuiltIn caaaar
syntax keyword ParenBuiltIn caaadr
syntax keyword ParenBuiltIn caaar
syntax keyword ParenBuiltIn caadar
syntax keyword ParenBuiltIn caaddr
syntax keyword ParenBuiltIn caadr
syntax keyword ParenBuiltIn caar
syntax keyword ParenBuiltIn cadaar
syntax keyword ParenBuiltIn cadadr
syntax keyword ParenBuiltIn cadar
syntax keyword ParenBuiltIn caddar
syntax keyword ParenBuiltIn cadddr
syntax keyword ParenBuiltIn caddr
syntax keyword ParenBuiltIn cadr
syntax keyword ParenBuiltIn car
syntax keyword ParenBuiltIn car!
syntax keyword ParenBuiltIn catch
syntax keyword ParenBuiltIn cdaaar
syntax keyword ParenBuiltIn cdaadr
syntax keyword ParenBuiltIn cdaar
syntax keyword ParenBuiltIn cdadar
syntax keyword ParenBuiltIn cdaddr
syntax keyword ParenBuiltIn cdadr
syntax keyword ParenBuiltIn cdar
syntax keyword ParenBuiltIn cddaar
syntax keyword ParenBuiltIn cddadr
syntax keyword ParenBuiltIn cddar
syntax keyword ParenBuiltIn cdddar
syntax keyword ParenBuiltIn cddddr
syntax keyword ParenBuiltIn cdddr
syntax keyword ParenBuiltIn cddr
syntax keyword ParenBuiltIn cdr
syntax keyword ParenBuiltIn cdr!
syntax keyword ParenBuiltIn chdir
syntax keyword ParenBuiltIn chr
syntax keyword ParenBuiltIn chunk
syntax keyword ParenBuiltIn class
syntax keyword ParenBuiltIn clock
syntax keyword ParenBuiltIn collect
syntax keyword ParenBuiltIn complement
syntax keyword ParenBuiltIn compose
syntax keyword ParenBuiltIn concat
syntax keyword ParenBuiltIn cons
syntax keyword ParenBuiltIn cons?
syntax keyword ParenBuiltIn continue
syntax keyword ParenBuiltIn cos
syntax keyword ParenBuiltIn cosh
syntax keyword ParenBuiltIn count
syntax keyword ParenBuiltIn cycle
syntax keyword ParenBuiltIn dict
syntax keyword ParenBuiltIn dict?
syntax keyword ParenBuiltIn difference
syntax keyword ParenBuiltIn digit?
syntax keyword ParenBuiltIn doarray
syntax keyword ParenBuiltIn dolist
syntax keyword ParenBuiltIn dostring
syntax keyword ParenBuiltIn dotimes
syntax keyword ParenBuiltIn drop
syntax keyword ParenBuiltIn drop-last
syntax keyword ParenBuiltIn drop-while
syntax keyword ParenBuiltIn dynamic
syntax keyword ParenBuiltIn empty?
syntax keyword ParenBuiltIn eval
syntax keyword ParenBuiltIn even?
syntax keyword ParenBuiltIn every-adjacent?
syntax keyword ParenBuiltIn every?
syntax keyword ParenBuiltIn exit
syntax keyword ParenBuiltIn exp
syntax keyword ParenBuiltIn f
syntax keyword ParenBuiltIn fclose
syntax keyword ParenBuiltIn fgetc
syntax keyword ParenBuiltIn fgets
syntax keyword ParenBuiltIn fill!
syntax keyword ParenBuiltIn find-class
syntax keyword ParenBuiltIn find-method
syntax keyword ParenBuiltIn flatten
syntax keyword ParenBuiltIn float
syntax keyword ParenBuiltIn fopen
syntax keyword ParenBuiltIn for
syntax keyword ParenBuiltIn foreach
syntax keyword ParenBuiltIn format
syntax keyword ParenBuiltIn fp
syntax keyword ParenBuiltIn fputc
syntax keyword ParenBuiltIn fread
syntax keyword ParenBuiltIn fseek
syntax keyword ParenBuiltIn ftell
syntax keyword ParenBuiltIn function
syntax keyword ParenBuiltIn function!
syntax keyword ParenBuiltIn function?
syntax keyword ParenBuiltIn fwrite
syntax keyword ParenBuiltIn getcwd
syntax keyword ParenBuiltIn getenv
syntax keyword ParenBuiltIn group
syntax keyword ParenBuiltIn group-by
syntax keyword ParenBuiltIn hash
syntax keyword ParenBuiltIn hex
syntax keyword ParenBuiltIn identity
syntax keyword ParenBuiltIn if
syntax keyword ParenBuiltIn import
syntax keyword ParenBuiltIn in?
syntax keyword ParenBuiltIn index
syntax keyword ParenBuiltIn int
syntax keyword ParenBuiltIn int?
syntax keyword ParenBuiltIn int32
syntax keyword ParenBuiltIn intersection
syntax keyword ParenBuiltIn is-a?
syntax keyword ParenBuiltIn join
syntax keyword ParenBuiltIn juxt
syntax keyword ParenBuiltIn keep
syntax keyword ParenBuiltIn keep1
syntax keyword ParenBuiltIn keys
syntax keyword ParenBuiltIn keyword
syntax keyword ParenBuiltIn keyword?
syntax keyword ParenBuiltIn last
syntax keyword ParenBuiltIn last-cons
syntax keyword ParenBuiltIn last-index
syntax keyword ParenBuiltIn len
syntax keyword ParenBuiltIn let
syntax keyword ParenBuiltIn list
syntax keyword ParenBuiltIn list...
syntax keyword ParenBuiltIn list?
syntax keyword ParenBuiltIn load
syntax keyword ParenBuiltIn log
syntax keyword ParenBuiltIn loop
syntax keyword ParenBuiltIn lower
syntax keyword ParenBuiltIn lower?
syntax keyword ParenBuiltIn ltrim
syntax keyword ParenBuiltIn macro
syntax keyword ParenBuiltIn macro?
syntax keyword ParenBuiltIn macroexpand
syntax keyword ParenBuiltIn macroexpand-1
syntax keyword ParenBuiltIn map
syntax keyword ParenBuiltIn map-group
syntax keyword ParenBuiltIn max
syntax keyword ParenBuiltIn member
syntax keyword ParenBuiltIn memcmp
syntax keyword ParenBuiltIn memcpy
syntax keyword ParenBuiltIn method
syntax keyword ParenBuiltIn min
syntax keyword ParenBuiltIn mkdir
syntax keyword ParenBuiltIn neg?
syntax keyword ParenBuiltIn nil?
syntax keyword ParenBuiltIn none?
syntax keyword ParenBuiltIn number?
syntax keyword ParenBuiltIn object?
syntax keyword ParenBuiltIn oct
syntax keyword ParenBuiltIn odd?
syntax keyword ParenBuiltIn ord
syntax keyword ParenBuiltIn params
syntax keyword ParenBuiltIn partial
syntax keyword ParenBuiltIn path
syntax keyword ParenBuiltIn pclose
syntax keyword ParenBuiltIn pop!
syntax keyword ParenBuiltIn popen
syntax keyword ParenBuiltIn pos?
syntax keyword ParenBuiltIn position
syntax keyword ParenBuiltIn pow
syntax keyword ParenBuiltIn prefix?
syntax keyword ParenBuiltIn print
syntax keyword ParenBuiltIn print?
syntax keyword ParenBuiltIn printf
syntax keyword ParenBuiltIn println
syntax keyword ParenBuiltIn product
syntax keyword ParenBuiltIn push!
syntax keyword ParenBuiltIn putenv
syntax keyword ParenBuiltIn quasiquote
syntax keyword ParenBuiltIn quit
syntax keyword ParenBuiltIn quote
syntax keyword ParenBuiltIn raise
syntax keyword ParenBuiltIn read
syntax keyword ParenBuiltIn read-byte
syntax keyword ParenBuiltIn read-bytes
syntax keyword ParenBuiltIn read-char
syntax keyword ParenBuiltIn read-line
syntax keyword ParenBuiltIn readdir
syntax keyword ParenBuiltIn reader-macro
syntax keyword ParenBuiltIn reduce
syntax keyword ParenBuiltIn reject
syntax keyword ParenBuiltIn remove
syntax keyword ParenBuiltIn rename
syntax keyword ParenBuiltIn repeat
syntax keyword ParenBuiltIn repl
syntax keyword ParenBuiltIn return
syntax keyword ParenBuiltIn reverse
syntax keyword ParenBuiltIn reverse!
syntax keyword ParenBuiltIn rtrim
syntax keyword ParenBuiltIn select
syntax keyword ParenBuiltIn select1
syntax keyword ParenBuiltIn sin
syntax keyword ParenBuiltIn sinh
syntax keyword ParenBuiltIn sleep
syntax keyword ParenBuiltIn slice
syntax keyword ParenBuiltIn some?
syntax keyword ParenBuiltIn sort!
syntax keyword ParenBuiltIn space?
syntax keyword ParenBuiltIn special-operator
syntax keyword ParenBuiltIn special-operator?
syntax keyword ParenBuiltIn split
syntax keyword ParenBuiltIn split-at
syntax keyword ParenBuiltIn split-with
syntax keyword ParenBuiltIn sqrt
syntax keyword ParenBuiltIn stat
syntax keyword ParenBuiltIn str
syntax keyword ParenBuiltIn string
syntax keyword ParenBuiltIn string!
syntax keyword ParenBuiltIn string?
syntax keyword ParenBuiltIn suffix?
syntax keyword ParenBuiltIn swap!
syntax keyword ParenBuiltIn symbol
syntax keyword ParenBuiltIn symbol?
syntax keyword ParenBuiltIn symmetric-difference
syntax keyword ParenBuiltIn system
syntax keyword ParenBuiltIn take
syntax keyword ParenBuiltIn take-last
syntax keyword ParenBuiltIn take-while
syntax keyword ParenBuiltIn tan
syntax keyword ParenBuiltIn tanh
syntax keyword ParenBuiltIn throw
syntax keyword ParenBuiltIn time
syntax keyword ParenBuiltIn timeit
syntax keyword ParenBuiltIn title
syntax keyword ParenBuiltIn title?
syntax keyword ParenBuiltIn trim
syntax keyword ParenBuiltIn union
syntax keyword ParenBuiltIn uniq
syntax keyword ParenBuiltIn unquote
syntax keyword ParenBuiltIn unquote-splicing
syntax keyword ParenBuiltIn unwind-protect
syntax keyword ParenBuiltIn upper
syntax keyword ParenBuiltIn upper?
syntax keyword ParenBuiltIn utcoffset
syntax keyword ParenBuiltIn utime
syntax keyword ParenBuiltIn vals
syntax keyword ParenBuiltIn var
syntax keyword ParenBuiltIn wcwidth
syntax keyword ParenBuiltIn when
syntax keyword ParenBuiltIn while
syntax keyword ParenBuiltIn with-arrow-syntax
syntax keyword ParenBuiltIn with-gensyms
syntax keyword ParenBuiltIn with-memory-stream
syntax keyword ParenBuiltIn with-open
syntax keyword ParenBuiltIn with-process
syntax keyword ParenBuiltIn write
syntax keyword ParenBuiltIn write-byte
syntax keyword ParenBuiltIn write-bytes
syntax keyword ParenBuiltIn write-line
syntax keyword ParenBuiltIn zero?
syntax keyword ParenBuiltIn zip

" }}}

syntax match ParenMethod "\<\.\k*\>"
syntax match ParenClass "\<:\u\k*\>"
syntax match ParenInstansAccesser "\<&\k*\>"

highlight def link ParenComment Comment
highlight def link ParenBlockComment Comment
highlight def link ParenString String
highlight def link ParenNumber Number
highlight def link ParenSymbol Identifier
highlight def link ParenBuiltIn Statement
highlight def link ParenConstant Constant
highlight def link ParenGlobal Identifier
highlight def link ParenKeyword Identifier
highlight def link ParenTodo ToDo
highlight def link ParenClass Type
highlight def link ParenMethod Function
highlight def link ParenInstansAccesser Function
highlight def link ParenError Error

let b:current_syntax = "paren"
