vim9script

# Highlight the whole line for marked entries, not just the leading "*".
syntax match FilerMarkedLine /^\s*\*.*/

highlight FilerMarked ctermfg=220 cterm=bold guifg=#ffcc33 gui=bold
highlight FilerMarkedLine ctermfg=220 ctermbg=236 gui=bold guifg=#ffcc33 guibg=#303030
