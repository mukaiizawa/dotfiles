
function! CompleteLispWords(findstart, base)
  if a:findstart
    let s:cur_text = strpart(getline('.'), 0, col('.') - 1)
    return match(s:cur_text, '\f*$')
  endif
  let s:words = {
        \   'list0' : ['a b c &rest d', 'value0'],
        \   'list1' : ['a b c &rest d', 'value1'],
        \   'list2' : ['a b c &rest d', 'value2'],
        \   'list3' : ['a b c &rest d', 'value3'],
        \   'list4' : ['a b c &rest d', 'value4']
        \ }
  let s:list = []
  for s:word in keys(s:words)
    call add(s:list, {
          \ 'word' : s:word,
          \ 'abbr' : printf('%s %s => %s', s:word, (s:words[s:word])[0], (s:words[s:word])[1])
          \ })
  endfor
  return s:list
endfunction


