if exists("b:current_syntax")
  finish
endif

syn sync minlines=100
syn case match

syn match XMDCode "^ \{4\}.*$"
syn match XMDDelim "^[#+-]\+" contained
syn match XMDList "^[-+]\+\ .*$" contains=XMDDelim
syn match XMDQuote "^[>]\+.*$"
syn match XMDTableSep "^--$"
syn match XMDTitle "^#\+\ .*$" contains=XMDDelim

hi def link XMDCode Function
hi def link XMDDelim Delimiter
hi def link XMDQuote Comment
hi def link XMDTableSep Statement
hi def link XMDTitle title

let b:current_syntax = "xmd"
