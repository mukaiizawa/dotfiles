
" add accessor
nnoremap <buffer> sa ^t mawv;"ty;wve"nyG{o
      \ public <C-r>t get<C-r>n<ESC>,3l~A() {<CR>
      \   return <C-r>n;<CR>
      \ }<CR><Esc>{=ap}o
      \ public void set<C-r>n<Esc>,3l~A(<C-r>t <C-r>n) {<CR>
      \   this.<C-r>n = <C-r>n;<CR>
      \ }<CR><Esc>{=ap}`a

