" mulk.vim

setlocal noexpandtab
setlocal shiftwidth=2
setlocal tabstop=2

if executable('mulk')
  nnoremap <silent>gcm  :<C-u>lcd %:h<CR> :!mulk load % & mulk %:r<CR>
else
  nnoremap <silent>gcm  :<C-u>echo "mulk: command not found"<CR>
endif
