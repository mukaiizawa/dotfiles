function! unite#sources#startup_logo#define() abort
  return s:source
endfunction

let s:source = {
      \ 'name': 'startup_logo',
      \ 'description': 'startup logo and recent files',
      \ 'default_kind': 'command',
      \ 'sorters': 'sorter_nothing',
      \ }

function! s:source.gather_candidates(args, context) abort
  return g:unite_startup_logo#GatherCandidates(a:args, a:context)
endfunction
