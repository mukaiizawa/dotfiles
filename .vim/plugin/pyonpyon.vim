let s:gravity = 2.4

function! s:start_pyonpyon()
  set guioptions-=m
  redraw!
  winpos 4000 4000 | winsize 80 24
  let [s:maxX, s:maxY] = [getwinposx(), getwinposy()]
  let [s:unit_h, s:unit_v] = [s:maxX / 133.0, sqrt(s:maxY * s:gravity * 2)]
  let [s:v, s:w] = [-s:unit_h, s:unit_v]
  let [s:x, s:y] = [s:maxX, 0]
  set updatetime=13
  augroup PyonPyon
    autocmd!
    autocmd CursorHold,CursorHoldI * call s:pyonpyon()
  augroup END
  command! PyonPyon call <SID>stop_pyonpyon()
endfunction

function! s:stop_pyonpyon()
  augroup PyonPyon
    autocmd!
  augroup END
  command! PyonPyon call <SID>start_pyonpyon()
endfunction

function! s:pyonpyon()
  let s:x += s:v
  if s:x < 0
    let [s:x, s:v] = [0, -s:v]
  elseif s:x > s:maxX
    let [s:x, s:v] = [s:maxX, -s:v]
  endif

  let s:y += s:w
  if s:y < 0
    let [s:y, s:w] = [0, s:unit_v]
  elseif s:y > s:maxY
    let s:y = s:maxY
  end

  let s:w -= s:gravity

  execute "winpos " . float2nr(s:x) . " " . float2nr(s:maxY - s:y)
  call feedkeys(mode() ==# "i" ? "\<C-g>\<ESC>" : "g\<ESC>", "n")
endfunction

command! PyonPyon call <SID>start_pyonpyon()
