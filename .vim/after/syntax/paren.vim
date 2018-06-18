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

syn iskeyword 33,35,36-38,42-43,45-58,60-63,65-91,93-95,97-125
syn sync minlines=100
syn case match

syn region ParenList matchgroup=Delimiter start="(" end=")" contains=ALL
syn region ParenQuoted matchgroup=Identifier start="`" end="[ \t();]" contains=ALL
syn region ParenQuoted matchgroup=Identifier start="`(" end=")" contains=ALL
syn region ParenTilde matchgroup=PreProc start="\~" end="[ \t();]" contains=ALL
syn region ParenTilde matchgroup=PreProc start="\~(" end=")" contains=ALL
syn match ParenNumber "\d"
syn region ParenString start='"' skip='\\[\\"]' end='"'
syn match ParenLineComment ";.*$" contains=ParenTodo
syn match ParenConstant "\<[A-Z_]\{1,}\>"
syn match ParenGlobal "\<\$\k*\>"
syn match ParenKeyword "\<:\k*\>"
syn keyword ParenSymbol nil true
syn match ParenTodo "\c\<\(todo\|fixme\|note\)\>" contained
syn match ParenError ")"

syn keyword ParenBuiltin quote backquote unquote splice macro lambda <- if
syn keyword ParenBuiltin begin let cond
syn keyword ParenBuiltin function begin-if
syn keyword ParenBuiltin type

syn keyword ParenBuiltin nil? same? atom? cons? list? type? ! not and or

syn keyword ParenBuiltin cons list len nth map reduce append reverse
syn keyword ParenBuiltin add push pop last-cons last

syn keyword ParenBuiltin {} <-{} has-key?

syn keyword ParenBuiltin find find-if remove remove-if

syn keyword ParenBuiltin ->list

syn keyword ParenBuiltin + ++ <-+ - -- <-- * / = mod < > <= >= negated

syn match ParenBuiltin "\<\(<-\)\?c[ad]\{1,4}r\>"

hi def link ParenLineComment Comment
hi def link ParenBlockComment Comment
hi def link ParenString String
hi def link ParenNumber Number
hi def link ParenSymbol Identifier
hi def link ParenBuiltin Statement
hi def link ParenConstant Constant
hi def link ParenKeyword Identifier
hi def link ParenTodo ToDo
hi def link ParenError Error

let b:current_syntax = "paren"
