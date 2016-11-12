
" add accessor
nnoremap <buffer> sa ^t mawv;"ty;wve"nyo<CR>
      \ public <C-r>t get<C-r>n<ESC>,3l~hA() {<CR>
      \   return <C-r>n;<CR>
      \ }<CR><Esc>{=ap}o
      \ public void set<C-r>n<Esc>,3l~hA(<C-r>t <C-r>n) {<CR>
      \   this.<C-r>n = <C-r>n;<CR>
      \ }<Esc>{=ap}k
      \ V2{dG{P`a

