" unite.vim

imap <buffer> <CR> <Cmd>call unite#ExecuteDefaultAction()<CR>
nmap <buffer> <C-h> <Cmd>call unite#DeleteBackwardChar()<CR>
nmap <buffer> <C-l> <Cmd>call unite#RedrawPicker()<CR>
nmap <buffer> <CR> <Cmd>call unite#ExecuteDefaultAction()<CR>
nmap <buffer> A <Cmd>call unite#EnterInsertAtEnd()<CR>
nmap <buffer> G <Cmd>call unite#MoveToEdge(1)<CR>
nmap <buffer> I <Cmd>call unite#EnterInsertAtStart()<CR>
nmap <buffer> gg <Cmd>call unite#MoveToEdge(0)<CR>
nmap <buffer> i <Cmd>call unite#EnterInsertAtEnd()<CR>
nmap <buffer> j <Cmd>call unite#MoveSelection(1)<CR>
nmap <buffer> k <Cmd>call unite#MoveSelection(-1)<CR>
