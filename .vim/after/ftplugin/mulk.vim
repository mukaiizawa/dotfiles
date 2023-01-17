" mulk.vim

setl noet
setl sw=2
setl ts=2

if executable('mulk')
  nn <silent>gcm  :<C-u>lcd %:h<CR> :!mulk load % & mulk %:r<CR>
el
  nn <silent>gcm  :<C-u>echo "mulk: command not found"<CR>
en
