function! unite#sources#help#define() abort
  return s:source
endfunction

let s:source = {
      \ 'name': 'help',
      \ 'default_action': 'vsplit',
      \ }

function! s:source.gather_candidates(args, context) abort
  return g:unite_help#GatherCandidates(a:args, a:context)
endfunction
