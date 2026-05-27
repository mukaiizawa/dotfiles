vim9script

var is_windows = has('win16') || has('win32') || has('win64') || has('win95')
var yank_histories: dict<list<any>> = {}
var is_loaded = false

def DefaultRegisterFromClipboard(): string
  if has('clipboard')
    return has('unnamedplus') ? '+' : '*'
  endif
  return '"'
enddef

def NormalizeText(value: any): any
  if type(value) != v:t_string
    return value
  endif
  return substitute(value, '\x00', '', 'g')
enddef

def TruncateText(value: any): any
  if type(value) == v:t_list
    return mapnew(copy(value), (_, line) => TruncateText(line))
  endif
  if type(value) != v:t_string
    return value
  endif
  return strcharpart(value, 0, yank_length)
enddef

def EnsureRegister(register_name: string)
  if !has_key(yank_histories, register_name)
    yank_histories[register_name] = []
  endif
enddef

def LoadIfNeeded()
  if is_loaded
    return
  endif
  if filereadable(yank_file)
    var lines = readfile(yank_file)
    if !empty(lines)
      try
        yank_histories = json_decode(join(lines, "\n"))
      catch
        yank_histories = {}
      endtry
    endif
  endif
  for register_name in yank_save_registers
    EnsureRegister(register_name)
  endfor
  is_loaded = true
enddef

def Save()
  if unite#store#IsSudo() || yank_disable_write
    return
  endif
  LoadIfNeeded()
  unite#store#WriteList(yank_file, [json_encode(yank_histories)])
enddef

var base = is_windows
  ? substitute(expand($XDG_CACHE_HOME != '' ? $XDG_CACHE_HOME .. '/unite' : '~/.cache/unite'), '\\', '/', 'g')
  : expand($XDG_CACHE_HOME != '' ? $XDG_CACHE_HOME .. '/unite' : '~/.cache/unite')
var yank_file = base .. '/history'
var yank_limit = 100
var yank_length = 10000
var yank_save_registers = [DefaultRegisterFromClipboard()]
var yank_disable_write = false

export def Load()
  LoadIfNeeded()
enddef

export def GetHistories(): dict<list<any>>
  LoadIfNeeded()
  return copy(yank_histories)
enddef

export def GatherCandidates(args: list<any> = [], ctx: dict<any> = {}): list<dict<any>>
  LoadIfNeeded()
  var result: list<dict<any>> = []
  for regname in yank_save_registers
    for entry in get(yank_histories, regname, [])
      if len(entry) < 2
        continue
      endif
      var text = entry[0]
      if type(text) == v:t_list
        text = join(text, "\n")
      endif
      var display = substitute(text, '\n', '\\n', 'g')
      display = substitute(display, '\x00', '', 'g')
      add(result, {
        word: display,
        abbr: display,
        data: {
          regcontents: entry[0],
          regtype: entry[1],
        },
      })
    endfor
  endfor
  return result
enddef

export def Append()
  LoadIfNeeded()
  for register_name in yank_save_registers
    EnsureRegister(register_name)
    var contents = getreg(register_name, 1, 1)
    var regtype = getregtype(register_name)
    var value = type(contents) == v:t_list && len(contents) == 1 ? contents[0] : contents
    value = TruncateText(NormalizeText(value))
    if empty(value)
      continue
    endif

    var current = yank_histories[register_name]
    var found = index(mapnew(copy(current), (_, entry) => string(entry)), string([value, regtype]))
    if found >= 0
      remove(current, found)
    endif
    insert(current, [value, regtype], 0)
    if len(current) > yank_limit
      yank_histories[register_name] = current[: yank_limit - 1]
    endif
  endfor
  Save()
enddef

export def YankPost()
  Append()
enddef
