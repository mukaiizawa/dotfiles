vim9script

var saved_laststatus = -1
var saved_showtabline = -1
var saved_tabline = ''
var saved_ruler = false
var has_saved_ruler = false
const startup_dir = expand('<sfile>:p:h')

def ReadLines(path: string): list<string>
  return filereadable(path) ? readfile(path) : []
enddef

def DisplayWidth(text: string): number
  return strdisplaywidth(text)
enddef

def BlockRightAlign(lines: list<string>, width: number): list<string>
  if empty(lines)
    return []
  endif

  var max_width = 0
  for line in lines
    max_width = max([max_width, DisplayWidth(line)])
  endfor

  var left_padding = repeat(' ', max([0, width - max_width]))
  return mapnew(copy(lines), (_, line) => left_padding .. line)
enddef

def RandomQuote(): string
  var quotes = ReadLines(startup_dir .. '/quotes')
  if empty(quotes)
    return ''
  endif
  return substitute(quotes[rand() % len(quotes)], '\t\+', '  ', 'g')
enddef

def SplashLines(): list<string>
  var banner = ReadLines(startup_dir .. '/banner')
  var logo = ReadLines(startup_dir .. '/logo')
  var lines = copy(banner)
  var right_margin = 0

  var bottom_margin = 5
  var padding_top = max([1, &lines - len(banner) - len(logo) - bottom_margin])
  for _ in range(padding_top - 1)
    add(lines, '')
  endfor

  for line in BlockRightAlign(logo, &columns - right_margin)
    add(lines, line)
  endfor

  add(lines, '')
  var quote = RandomQuote()
  if !empty(quote)
    add(lines, quote)
  endif

  return lines
enddef

def IsStartupBuffer(): bool
  return getbufvar(bufnr('%'), '&filetype') ==# 'startup'
enddef

def Restore()
  if saved_laststatus >= 0
    &laststatus = saved_laststatus
    saved_laststatus = -1
  endif
  if saved_showtabline >= 0
    &showtabline = saved_showtabline
    saved_showtabline = -1
  endif
  if saved_tabline !=# ''
    &tabline = saved_tabline
    saved_tabline = ''
  endif
  if has_saved_ruler
    &ruler = saved_ruler
    has_saved_ruler = false
  endif
enddef

def Open()
  if !IsStartupBuffer()
    return
  endif
  Restore()
  setlocal modifiable
  bwipeout!
  execute 'Unite file'
enddef

def Show()
  if argc() > 0 || !empty(v:swapcommand) || !empty(expand('%:p')) || line('$') > 1 || getline(1) !=# ''
    return
  endif

  saved_laststatus = &laststatus
  saved_showtabline = &showtabline
  saved_tabline = &tabline
  saved_ruler = &ruler
  has_saved_ruler = true
  set laststatus=0
  set showtabline=0
  set tabline=
  set noruler

  execute 'file Vim'
  setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted
  setlocal filetype=startup
  setlocal modifiable
  setlocal nolist nonumber norelativenumber nocursorline nospell
  setlocal signcolumn=no foldcolumn=0 colorcolumn=
  setlocal nowrap

  var splash = SplashLines()
  setline(1, splash)
  if line('$') > len(splash)
    deletebufline('%', len(splash) + 1, '$')
  endif
  setlocal nomodified nomodifiable
  normal! gg0

  augroup startup_buffer
    autocmd! * <buffer>
    autocmd BufLeave <buffer> call Restore()
  augroup END

  nnoremap <silent><buffer> <CR> <ScriptCmd>Open()<CR>
  nnoremap <silent><buffer> i <ScriptCmd>Open()<CR>
  nnoremap <silent><buffer> a <Nop>
  nnoremap <silent><buffer> o <Nop>
  nnoremap <silent><buffer> O <Nop>
enddef

command! Startup call Show()

augroup startup_screen
  autocmd!
  autocmd VimEnter * call Show()
augroup END
