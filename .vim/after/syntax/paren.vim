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
syn region ParenBlockComment start='"""' end='"""' contains=ParenTodo,ParenDoc
syn match ParenVariable "\<\k\>"
syn match ParenConstant "\<[A-Z_]\{1,}\>"
syn match ParenGlobal "\<$\k*\>"
syn match ParenKeyword "\<:\k*\>"
syn match ParenDoc "@\(note\|param\|return\|throws\)" contained
syn match ParenTodo "\c\<\(todo\|fixme\|note\)\>" contained
syn match ParenError ")"

" builtin function/macro
syn keyword ParenBuiltin def fn if let quote <-
" numeric
syn keyword ParenBuiltin + - * / = mod < > <= >=
syn match ParenBuiltin "\<c[ad]\{1,5}r\>"

hi def link ParenLineComment Comment
hi def link ParenBlockComment Comment
hi def link ParenDoc Special
hi def link ParenString String
hi def link ParenNumber Number
hi def link ParenVariable Pmenu
hi def link ParenGlobal Identifier
hi def link ParenBuiltin Statement
hi def link ParenConstant Constant
hi def link ParenKeyword Identifier
hi def link ParenTodo ToDo
hi def link ParenError Error

let b:current_syntax = "paren"
