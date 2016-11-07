
" add accessor
nnoremap <buffer> sa ^wvf "ty;wve"nyo<CR>
      \ public <C-r>t<C-r>n<ESC>biget<Esc>l~hea() {<CR>
      \   return <C-r>n;<CR>
      \ }<CR><Esc>(=ap)o
      \ public void <C-r>n<ESC>biset<Esc>l~hea(<C-r>t<C-r>n) {<CR>
      \   this.<C-r>n = <C-r>n;<CR>
      \ }<Esc>(=ap)j

