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
syn keyword ParenSymbol nil true
syn match ParenTodo "\c\<\(todo\|note\)\>" contained
syn match ParenError ")"

" special -- see special.wk
syn keyword ParenBuiltin let
syn keyword ParenBuiltin dynamic
syn keyword ParenBuiltin symbol_bind
syn keyword ParenBuiltin begin
syn keyword ParenBuiltin macro
syn keyword ParenBuiltin lambda
syn keyword ParenBuiltin quote
syn keyword ParenBuiltin if
syn keyword ParenBuiltin unwind_protect
syn keyword ParenBuiltin labels
syn keyword ParenBuiltin goto
syn keyword ParenBuiltin throw
syn keyword ParenBuiltin basic_catch
syn keyword ParenBuiltin return
syn keyword ParenBuiltin assert

" built-in -- see prim.wk
syn keyword ParenBuiltin apply
syn keyword ParenBuiltin car
syn keyword ParenBuiltin cdr
syn keyword ParenBuiltin ceiling
syn keyword ParenBuiltin cons
syn keyword ParenBuiltin eval
syn keyword ParenBuiltin fclose
syn keyword ParenBuiltin fgetc
syn keyword ParenBuiltin fgets
syn keyword ParenBuiltin floor
syn keyword ParenBuiltin fopen
syn keyword ParenBuiltin fp
syn keyword ParenBuiltin fputc
syn keyword ParenBuiltin fread
syn keyword ParenBuiltin fseek
syn keyword ParenBuiltin ftell
syn keyword ParenBuiltin fwrite
syn keyword ParenBuiltin gensym
syn keyword ParenBuiltin not
syn keyword ParenBuiltin print
syn keyword ParenBuiltin samep
syn keyword ParenBuiltin time
syn keyword ParenBuiltin truncate

" automatic generated built-in function/macro {{{

syn keyword ParenBuiltin *
syn keyword ParenBuiltin +
syn keyword ParenBuiltin ++
syn keyword ParenBuiltin -
syn keyword ParenBuiltin --
syn keyword ParenBuiltin ->list
syn keyword ParenBuiltin .
syn keyword ParenBuiltin ..
syn keyword ParenBuiltin /
syn keyword ParenBuiltin //
syn keyword ParenBuiltin /=
syn keyword ParenBuiltin <
syn keyword ParenBuiltin <-
syn keyword ParenBuiltin <=
syn keyword ParenBuiltin =
syn keyword ParenBuiltin >
syn keyword ParenBuiltin >=
syn keyword ParenBuiltin []
syn keyword ParenBuiltin adjacent-satisfy?
syn keyword ParenBuiltin all-satisfy?
syn keyword ParenBuiltin and
syn keyword ParenBuiltin any-satisfy?
syn keyword ParenBuiltin append
syn keyword ParenBuiltin append-atom
syn keyword ParenBuiltin array-copy
syn keyword ParenBuiltin array-length
syn keyword ParenBuiltin array?
syn keyword ParenBuiltin atom?
syn keyword ParenBuiltin basic-catch
syn keyword ParenBuiltin begin0
syn keyword ParenBuiltin bit-and
syn keyword ParenBuiltin bit-or
syn keyword ParenBuiltin bit-shift
syn keyword ParenBuiltin bit-xor
syn keyword ParenBuiltin bound?
syn keyword ParenBuiltin break
syn keyword ParenBuiltin byte-array
syn keyword ParenBuiltin byte-array->string
syn keyword ParenBuiltin byte-array-length
syn keyword ParenBuiltin byte-array?
syn keyword ParenBuiltin byte?
syn keyword ParenBuiltin caaaar
syn keyword ParenBuiltin caaadr
syn keyword ParenBuiltin caaar
syn keyword ParenBuiltin caadar
syn keyword ParenBuiltin caaddr
syn keyword ParenBuiltin caadr
syn keyword ParenBuiltin caar
syn keyword ParenBuiltin cadaar
syn keyword ParenBuiltin cadadr
syn keyword ParenBuiltin cadar
syn keyword ParenBuiltin caddar
syn keyword ParenBuiltin cadddr
syn keyword ParenBuiltin caddr
syn keyword ParenBuiltin cadr
syn keyword ParenBuiltin call-stack
syn keyword ParenBuiltin car!
syn keyword ParenBuiltin catch
syn keyword ParenBuiltin cdaaar
syn keyword ParenBuiltin cdaadr
syn keyword ParenBuiltin cdaar
syn keyword ParenBuiltin cdadar
syn keyword ParenBuiltin cdaddr
syn keyword ParenBuiltin cdadr
syn keyword ParenBuiltin cdar
syn keyword ParenBuiltin cddaar
syn keyword ParenBuiltin cddadr
syn keyword ParenBuiltin cddar
syn keyword ParenBuiltin cdddar
syn keyword ParenBuiltin cddddr
syn keyword ParenBuiltin cdddr
syn keyword ParenBuiltin cddr
syn keyword ParenBuiltin cdr!
syn keyword ParenBuiltin char->digit
syn keyword ParenBuiltin char-alpha?
syn keyword ParenBuiltin char-digit?
syn keyword ParenBuiltin char-lower
syn keyword ParenBuiltin char-space?
syn keyword ParenBuiltin char-upper
syn keyword ParenBuiltin class
syn keyword ParenBuiltin class-exists?
syn keyword ParenBuiltin cons?
syn keyword ParenBuiltin continue
syn keyword ParenBuiltin copy-list
syn keyword ParenBuiltin dec!
syn keyword ParenBuiltin different?
syn keyword ParenBuiltin dolist
syn keyword ParenBuiltin dotimes
syn keyword ParenBuiltin even?
syn keyword ParenBuiltin find
syn keyword ParenBuiltin find-class
syn keyword ParenBuiltin find-cons
syn keyword ParenBuiltin find-cons-if
syn keyword ParenBuiltin find-if
syn keyword ParenBuiltin find-method
syn keyword ParenBuiltin flatten
syn keyword ParenBuiltin for
syn keyword ParenBuiltin function
syn keyword ParenBuiltin identity
syn keyword ParenBuiltin inc!
syn keyword ParenBuiltin integer?
syn keyword ParenBuiltin is-a?
syn keyword ParenBuiltin keyword?
syn keyword ParenBuiltin lambda-body
syn keyword ParenBuiltin lambda-parameter
syn keyword ParenBuiltin lambda?
syn keyword ParenBuiltin last
syn keyword ParenBuiltin last-cons
syn keyword ParenBuiltin length
syn keyword ParenBuiltin list
syn keyword ParenBuiltin list=
syn keyword ParenBuiltin list?
syn keyword ParenBuiltin macro?
syn keyword ParenBuiltin make-accessor
syn keyword ParenBuiltin make-method-dispatcher
syn keyword ParenBuiltin map
syn keyword ParenBuiltin method
syn keyword ParenBuiltin method?
syn keyword ParenBuiltin minus?
syn keyword ParenBuiltin mod
syn keyword ParenBuiltin negated
syn keyword ParenBuiltin nil?
syn keyword ParenBuiltin nth
syn keyword ParenBuiltin nthcdr
syn keyword ParenBuiltin number->integer
syn keyword ParenBuiltin number->string
syn keyword ParenBuiltin number?
syn keyword ParenBuiltin object?
syn keyword ParenBuiltin odd?
syn keyword ParenBuiltin operator?
syn keyword ParenBuiltin or
syn keyword ParenBuiltin plus?
syn keyword ParenBuiltin pop!
syn keyword ParenBuiltin push!
syn keyword ParenBuiltin quit
syn keyword ParenBuiltin read
syn keyword ParenBuiltin read-byte
syn keyword ParenBuiltin read-char
syn keyword ParenBuiltin reduce
syn keyword ParenBuiltin repl
syn keyword ParenBuiltin reverse
syn keyword ParenBuiltin same?
syn keyword ParenBuiltin special-operator?
syn keyword ParenBuiltin string+
syn keyword ParenBuiltin string->byte-array
syn keyword ParenBuiltin string->symbol
syn keyword ParenBuiltin string=
syn keyword ParenBuiltin string?
syn keyword ParenBuiltin sublist
syn keyword ParenBuiltin symbol->keyword
syn keyword ParenBuiltin symbol->string
syn keyword ParenBuiltin symbol?
syn keyword ParenBuiltin unless
syn keyword ParenBuiltin unwind-protect
syn keyword ParenBuiltin when
syn keyword ParenBuiltin while
syn keyword ParenBuiltin write-byte
syn keyword ParenBuiltin write-string
syn keyword ParenBuiltin zero?

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
hi def link ParenKeyword Identifier
hi def link ParenTodo ToDo
hi def link ParenClass Type
hi def link ParenMethod Function
hi def link ParenInstansAccesser Function
hi def link ParenError Error

let b:current_syntax = "paren"
