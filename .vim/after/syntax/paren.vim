if exists("b:current_syntax")
 finish
endif

"     0 1 2 3 4 5 6 7 8 9
"  30       ! " # $ % & '
"  40 ( ) * + , - . / 0 1
"  50 2 3 4 5 6 7 8 9 : ;
"  60 < = > ? @ A B C D E
"  70 F G H I J K L M N O
"  80 P Q R S T U V W X Y
"  90 Z [ \ ] ^ _ ` a b c
" 100 d e f g h i j k l m
" 110 n o p q r s t u v w
" 120 x y z { | } ~ .

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
syn keyword ParenSymbol nil true self
syn match ParenTodo "\c\<\(todo\|note\)\>" contained
syn match ParenError ")"

" automatic generated -- run rw.p {{{

syn keyword ParenBuiltin special-operator
syn keyword ParenBuiltin macro
syn keyword ParenBuiltin function
syn keyword ParenBuiltin function!
syn keyword ParenBuiltin builtin-function
syn keyword ParenBuiltin special-operator
syn keyword ParenBuiltin let
syn keyword ParenBuiltin <-
syn keyword ParenBuiltin begin
syn keyword ParenBuiltin quote
syn keyword ParenBuiltin if
syn keyword ParenBuiltin lambda
syn keyword ParenBuiltin return
syn keyword ParenBuiltin macro
syn keyword ParenBuiltin unwind-protect
syn keyword ParenBuiltin goto
syn keyword ParenBuiltin labels
syn keyword ParenBuiltin throw
syn keyword ParenBuiltin catch
syn keyword ParenBuiltin assert
syn keyword ParenBuiltin dynamic
syn keyword ParenBuiltin global-symbol
syn keyword ParenBuiltin function!
syn keyword ParenBuiltin builtin-function
syn keyword ParenBuiltin with-gensyms
syn keyword ParenBuiltin begin0
syn keyword ParenBuiltin when
syn keyword ParenBuiltin \|\|
syn keyword ParenBuiltin &&
syn keyword ParenBuiltin switch
syn keyword ParenBuiltin break
syn keyword ParenBuiltin continue
syn keyword ParenBuiltin for
syn keyword ParenBuiltin while
syn keyword ParenBuiltin dolist
syn keyword ParenBuiltin dotimes
syn keyword ParenBuiltin clock
syn keyword ParenBuiltin expand-macro
syn keyword ParenBuiltin expand-macro-all
syn keyword ParenBuiltin function
syn keyword ParenBuiltin eq?
syn keyword ParenBuiltin neq?
syn keyword ParenBuiltin address
syn keyword ParenBuiltin !
syn keyword ParenBuiltin nil?
syn keyword ParenBuiltin cons?
syn keyword ParenBuiltin atom?
syn keyword ParenBuiltin symbol?
syn keyword ParenBuiltin keyword?
syn keyword ParenBuiltin bound?
syn keyword ParenBuiltin gensym
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
syn keyword ParenBuiltin list->string
syn keyword ParenBuiltin length
syn keyword ParenBuiltin last-cons
syn keyword ParenBuiltin nth
syn keyword ParenBuiltin nthcdr
syn keyword ParenBuiltin first
syn keyword ParenBuiltin second
syn keyword ParenBuiltin third
syn keyword ParenBuiltin last
syn keyword ParenBuiltin butlast
syn keyword ParenBuiltin ..
syn keyword ParenBuiltin group
syn keyword ParenBuiltin reverse
syn keyword ParenBuiltin reverse!
syn keyword ParenBuiltin append-atom
syn keyword ParenBuiltin push!
syn keyword ParenBuiltin pop!
syn keyword ParenBuiltin assoc
syn keyword ParenBuiltin assoc!
syn keyword ParenBuiltin flatten
syn keyword ParenBuiltin map
syn keyword ParenBuiltin reduce
syn keyword ParenBuiltin find-cons
syn keyword ParenBuiltin find
syn keyword ParenBuiltin remove
syn keyword ParenBuiltin all-satisfy?
syn keyword ParenBuiltin any-satisfy?
syn keyword ParenBuiltin each-adjacent-satisfy?
syn keyword ParenBuiltin number?
syn keyword ParenBuiltin integer?
syn keyword ParenBuiltin byte?
syn keyword ParenBuiltin ascii-space?
syn keyword ParenBuiltin ascii-alpha?
syn keyword ParenBuiltin ascii-digit?
syn keyword ParenBuiltin ascii-lower
syn keyword ParenBuiltin ascii-upper
syn keyword ParenBuiltin ascii->digit
syn keyword ParenBuiltin digit->ascii
syn keyword ParenBuiltin =
syn keyword ParenBuiltin &
syn keyword ParenBuiltin \|
syn keyword ParenBuiltin <<
syn keyword ParenBuiltin >>
syn keyword ParenBuiltin ^
syn keyword ParenBuiltin /=
syn keyword ParenBuiltin +
syn keyword ParenBuiltin -
syn keyword ParenBuiltin *
syn keyword ParenBuiltin /
syn keyword ParenBuiltin //
syn keyword ParenBuiltin mod
syn keyword ParenBuiltin <
syn keyword ParenBuiltin >
syn keyword ParenBuiltin <=
syn keyword ParenBuiltin >=
syn keyword ParenBuiltin ++
syn keyword ParenBuiltin --
syn keyword ParenBuiltin abs
syn keyword ParenBuiltin exp
syn keyword ParenBuiltin string
syn keyword ParenBuiltin string?
syn keyword ParenBuiltin string-eq?
syn keyword ParenBuiltin string-codepoint
syn keyword ParenBuiltin string->array
syn keyword ParenBuiltin string-slice
syn keyword ParenBuiltin string-at
syn keyword ParenBuiltin string-length
syn keyword ParenBuiltin string-index
syn keyword ParenBuiltin string->list
syn keyword ParenBuiltin bytes
syn keyword ParenBuiltin bytes?
syn keyword ParenBuiltin bytes-eq?
syn keyword ParenBuiltin ->bytes
syn keyword ParenBuiltin bytes->symbol
syn keyword ParenBuiltin bytes->keyword
syn keyword ParenBuiltin bytes->string
syn keyword ParenBuiltin bytes->string!
syn keyword ParenBuiltin bytes-at
syn keyword ParenBuiltin bytes-at!
syn keyword ParenBuiltin bytes-length
syn keyword ParenBuiltin bytes-index
syn keyword ParenBuiltin bytes-unmatch-index
syn keyword ParenBuiltin bytes-copy
syn keyword ParenBuiltin bytes-slice
syn keyword ParenBuiltin bytes-concat
syn keyword ParenBuiltin array
syn keyword ParenBuiltin array?
syn keyword ParenBuiltin array->list
syn keyword ParenBuiltin array-at
syn keyword ParenBuiltin array-at!
syn keyword ParenBuiltin array-length
syn keyword ParenBuiltin array-copy
syn keyword ParenBuiltin array-slice
syn keyword ParenBuiltin object?
syn keyword ParenBuiltin is-a?
syn keyword ParenBuiltin find-class
syn keyword ParenBuiltin find-method
syn keyword ParenBuiltin error-if-not-object
syn keyword ParenBuiltin make-accessor
syn keyword ParenBuiltin make-method-dispatcher
syn keyword ParenBuiltin class
syn keyword ParenBuiltin method
syn keyword ParenBuiltin error
syn keyword ParenBuiltin with-ahead-reader
syn keyword ParenBuiltin read-byte
syn keyword ParenBuiltin read-char
syn keyword ParenBuiltin read-line
syn keyword ParenBuiltin read
syn keyword ParenBuiltin write-byte
syn keyword ParenBuiltin write-bytes
syn keyword ParenBuiltin write-line
syn keyword ParenBuiltin write
syn keyword ParenBuiltin with-memory-stream
syn keyword ParenBuiltin with-open-mode
syn keyword ParenBuiltin with-open-read
syn keyword ParenBuiltin with-open-write
syn keyword ParenBuiltin with-open-append
syn keyword ParenBuiltin with-open-update
syn keyword ParenBuiltin eval
syn keyword ParenBuiltin apply
syn keyword ParenBuiltin repl
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
