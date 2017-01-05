setlocal shiftwidth=2
setlocal noexpandtab

if executable('mulk')
  nnoremap <silent>gcm  :<C-u>lcd %:h<CR> :!mulk load % & mulk %:r<CR>
else
  nnoremap <silent>gcm  :<C-u>echo "clisp: command not found"<CR>
endif
