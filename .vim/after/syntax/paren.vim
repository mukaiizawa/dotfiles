if exists("b:current_syntax")
 finish
endif

syn sync minlines=1000
syn case match

syn region ParenList matchgroup=Delimiter start="(" end=")" contains=ALL
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
syn match ParenBuiltin "\[]"
syn match ParenBuiltin "\[]<-"
syn keyword ParenSymbol nil true self
syn match ParenTodo "\c\<\(todo\|note\)\>" contained
syn match ParenError ")"

" automatic generated -- see make rw.vim {{{

syn keyword ParenBuiltin special-operator
syn keyword ParenBuiltin <-
syn keyword ParenBuiltin let
syn keyword ParenBuiltin begin
syn keyword ParenBuiltin quote
syn keyword ParenBuiltin if
syn keyword ParenBuiltin f
syn keyword ParenBuiltin return
syn keyword ParenBuiltin macro
syn keyword ParenBuiltin unwind-protect
syn keyword ParenBuiltin loop
syn keyword ParenBuiltin break
syn keyword ParenBuiltin continue
syn keyword ParenBuiltin throw
syn keyword ParenBuiltin catch
syn keyword ParenBuiltin assert
syn keyword ParenBuiltin dynamic
syn keyword ParenBuiltin function!
syn keyword ParenBuiltin builtin-function
syn keyword ParenBuiltin with-gensyms
syn keyword ParenBuiltin begin0
syn keyword ParenBuiltin when
syn keyword ParenBuiltin \|\|
syn keyword ParenBuiltin &&
syn keyword ParenBuiltin while
syn keyword ParenBuiltin for
syn keyword ParenBuiltin dolist
syn keyword ParenBuiltin dotimes
syn keyword ParenBuiltin dostring
syn keyword ParenBuiltin doarray
syn keyword ParenBuiltin timeit
syn keyword ParenBuiltin expand-macro
syn keyword ParenBuiltin expand-macro-all
syn keyword ParenBuiltin function
syn keyword ParenBuiltin =
syn keyword ParenBuiltin ==
syn keyword ParenBuiltin !
syn keyword ParenBuiltin !=
syn keyword ParenBuiltin !==
syn keyword ParenBuiltin hash
syn keyword ParenBuiltin address
syn keyword ParenBuiltin function?
syn keyword ParenBuiltin builtin?
syn keyword ParenBuiltin special-operator?
syn keyword ParenBuiltin macro?
syn keyword ParenBuiltin procparams
syn keyword ParenBuiltin procbody
syn keyword ParenBuiltin nil?
syn keyword ParenBuiltin cons?
syn keyword ParenBuiltin atom?
syn keyword ParenBuiltin cons
syn keyword ParenBuiltin car
syn keyword ParenBuiltin car!
syn keyword ParenBuiltin cdr
syn keyword ParenBuiltin cdr!
syn keyword ParenBuiltin caar
syn keyword ParenBuiltin cadr
syn keyword ParenBuiltin cdar
syn keyword ParenBuiltin cddr
syn keyword ParenBuiltin caaar
syn keyword ParenBuiltin caadr
syn keyword ParenBuiltin cadar
syn keyword ParenBuiltin caddr
syn keyword ParenBuiltin cdaar
syn keyword ParenBuiltin cdadr
syn keyword ParenBuiltin cddar
syn keyword ParenBuiltin cdddr
syn keyword ParenBuiltin caaaar
syn keyword ParenBuiltin caaadr
syn keyword ParenBuiltin caadar
syn keyword ParenBuiltin caaddr
syn keyword ParenBuiltin cadaar
syn keyword ParenBuiltin cadadr
syn keyword ParenBuiltin caddar
syn keyword ParenBuiltin cadddr
syn keyword ParenBuiltin cdaaar
syn keyword ParenBuiltin cdaadr
syn keyword ParenBuiltin cdadar
syn keyword ParenBuiltin cdaddr
syn keyword ParenBuiltin cddaar
syn keyword ParenBuiltin cddadr
syn keyword ParenBuiltin cdddar
syn keyword ParenBuiltin cddddr
syn keyword ParenBuiltin list
syn keyword ParenBuiltin list?
syn keyword ParenBuiltin ->list
syn keyword ParenBuiltin join
syn keyword ParenBuiltin split
syn keyword ParenBuiltin last-cons
syn keyword ParenBuiltin last
syn keyword ParenBuiltin butlast
syn keyword ParenBuiltin assoc
syn keyword ParenBuiltin ..
syn keyword ParenBuiltin group
syn keyword ParenBuiltin reverse
syn keyword ParenBuiltin reverse!
syn keyword ParenBuiltin push!
syn keyword ParenBuiltin pop!
syn keyword ParenBuiltin flatten
syn keyword ParenBuiltin collect
syn keyword ParenBuiltin zip
syn keyword ParenBuiltin map
syn keyword ParenBuiltin foreach
syn keyword ParenBuiltin reduce
syn keyword ParenBuiltin find
syn keyword ParenBuiltin select
syn keyword ParenBuiltin except
syn keyword ParenBuiltin position
syn keyword ParenBuiltin every?
syn keyword ParenBuiltin some?
syn keyword ParenBuiltin none?
syn keyword ParenBuiltin every-adjacent?
syn keyword ParenBuiltin union
syn keyword ParenBuiltin intersection
syn keyword ParenBuiltin difference
syn keyword ParenBuiltin number?
syn keyword ParenBuiltin byte?
syn keyword ParenBuiltin int?
syn keyword ParenBuiltin int
syn keyword ParenBuiltin int32
syn keyword ParenBuiltin float
syn keyword ParenBuiltin +
syn keyword ParenBuiltin -
syn keyword ParenBuiltin *
syn keyword ParenBuiltin /
syn keyword ParenBuiltin //
syn keyword ParenBuiltin %
syn keyword ParenBuiltin <
syn keyword ParenBuiltin >
syn keyword ParenBuiltin <=
syn keyword ParenBuiltin >=
syn keyword ParenBuiltin ++
syn keyword ParenBuiltin --
syn keyword ParenBuiltin ~
syn keyword ParenBuiltin &
syn keyword ParenBuiltin \|
syn keyword ParenBuiltin ^
syn keyword ParenBuiltin <<
syn keyword ParenBuiltin >>
syn keyword ParenBuiltin abs
syn keyword ParenBuiltin max
syn keyword ParenBuiltin min
syn keyword ParenBuiltin sin
syn keyword ParenBuiltin cos
syn keyword ParenBuiltin tan
syn keyword ParenBuiltin asin
syn keyword ParenBuiltin acos
syn keyword ParenBuiltin atan
syn keyword ParenBuiltin sinh
syn keyword ParenBuiltin cosh
syn keyword ParenBuiltin tanh
syn keyword ParenBuiltin exp
syn keyword ParenBuiltin log
syn keyword ParenBuiltin sqrt
syn keyword ParenBuiltin symbol
syn keyword ParenBuiltin keyword
syn keyword ParenBuiltin symbol?
syn keyword ParenBuiltin keyword?
syn keyword ParenBuiltin symcmp
syn keyword ParenBuiltin bound?
syn keyword ParenBuiltin string
syn keyword ParenBuiltin string!
syn keyword ParenBuiltin str
syn keyword ParenBuiltin bin
syn keyword ParenBuiltin oct
syn keyword ParenBuiltin hex
syn keyword ParenBuiltin string?
syn keyword ParenBuiltin chr
syn keyword ParenBuiltin ord
syn keyword ParenBuiltin wcwidth
syn keyword ParenBuiltin ascii?
syn keyword ParenBuiltin alnum?
syn keyword ParenBuiltin alpha?
syn keyword ParenBuiltin digit?
syn keyword ParenBuiltin space?
syn keyword ParenBuiltin print?
syn keyword ParenBuiltin lower?
syn keyword ParenBuiltin upper?
syn keyword ParenBuiltin lower
syn keyword ParenBuiltin upper
syn keyword ParenBuiltin strstr
syn keyword ParenBuiltin strlstr
syn keyword ParenBuiltin format
syn keyword ParenBuiltin memlen
syn keyword ParenBuiltin prefix?
syn keyword ParenBuiltin suffix?
syn keyword ParenBuiltin memmem
syn keyword ParenBuiltin memcpy
syn keyword ParenBuiltin memcat
syn keyword ParenBuiltin memcmp
syn keyword ParenBuiltin bytes
syn keyword ParenBuiltin bytes?
syn keyword ParenBuiltin array
syn keyword ParenBuiltin array?
syn keyword ParenBuiltin array->list
syn keyword ParenBuiltin dict
syn keyword ParenBuiltin dict?
syn keyword ParenBuiltin keys
syn keyword ParenBuiltin concat
syn keyword ParenBuiltin slice
syn keyword ParenBuiltin swap!
syn keyword ParenBuiltin sort!
syn keyword ParenBuiltin in?
syn keyword ParenBuiltin len
syn keyword ParenBuiltin empty?
syn keyword ParenBuiltin fp
syn keyword ParenBuiltin fopen
syn keyword ParenBuiltin fgetc
syn keyword ParenBuiltin fputc
syn keyword ParenBuiltin fgets
syn keyword ParenBuiltin fread
syn keyword ParenBuiltin fwrite
syn keyword ParenBuiltin fseek
syn keyword ParenBuiltin ftell
syn keyword ParenBuiltin fclose
syn keyword ParenBuiltin stat
syn keyword ParenBuiltin utime
syn keyword ParenBuiltin getcwd
syn keyword ParenBuiltin chdir
syn keyword ParenBuiltin readdir
syn keyword ParenBuiltin remove
syn keyword ParenBuiltin mkdir
syn keyword ParenBuiltin rename
syn keyword ParenBuiltin time
syn keyword ParenBuiltin clock
syn keyword ParenBuiltin cycle
syn keyword ParenBuiltin utcoffset
syn keyword ParenBuiltin sleep
syn keyword ParenBuiltin system
syn keyword ParenBuiltin getenv
syn keyword ParenBuiltin putenv
syn keyword ParenBuiltin object?
syn keyword ParenBuiltin is-a?
syn keyword ParenBuiltin find-class
syn keyword ParenBuiltin find-method
syn keyword ParenBuiltin make-accessor
syn keyword ParenBuiltin make-method-dispatcher
syn keyword ParenBuiltin class
syn keyword ParenBuiltin method
syn keyword ParenBuiltin overload
syn keyword ParenBuiltin path
syn keyword ParenBuiltin path.getcwd
syn keyword ParenBuiltin unquote
syn keyword ParenBuiltin unquote-splicing
syn keyword ParenBuiltin quasiquote
syn keyword ParenBuiltin reader-macro
syn keyword ParenBuiltin read-byte
syn keyword ParenBuiltin read-bytes
syn keyword ParenBuiltin read-char
syn keyword ParenBuiltin read-line
syn keyword ParenBuiltin read
syn keyword ParenBuiltin write-byte
syn keyword ParenBuiltin write-bytes
syn keyword ParenBuiltin write-line
syn keyword ParenBuiltin write
syn keyword ParenBuiltin with-memory-stream
syn keyword ParenBuiltin with-open
syn keyword ParenBuiltin eval
syn keyword ParenBuiltin apply
syn keyword ParenBuiltin repl
syn keyword ParenBuiltin raise
syn keyword ParenBuiltin quit
syn keyword ParenBuiltin load
syn keyword ParenBuiltin import
syn keyword ParenBuiltin boot

" }}}

syn match ParenMethod "\<\.\k*\>"
syn match ParenClass "\<:\u\k*\>"
syn match ParenInstansAccesser "\<&\k*\>"

hi def link ParenComment Comment
hi def link ParenBlockComment Comment
hi def link ParenString String
hi def link ParenNumber Number
hi def link ParenSymbol Identifier
hi def link ParenBuiltin Statement
hi def link ParenConstant Constant
hi def link ParenGlobal Identifier
hi def link ParenKeyword Identifier
hi def link ParenTodo ToDo
hi def link ParenClass Type
hi def link ParenMethod Function
hi def link ParenInstansAccesser Function
hi def link ParenError Error

let b:current_syntax = "paren"
