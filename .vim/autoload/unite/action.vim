vim9script

def CandidateData(candidate: dict<any>): dict<any>
  return get(candidate, 'data', {})
enddef

export def Open(candidate: dict<any>, ctx: dict<any>, api: dict<any>)
  var data = CandidateData(candidate)
  if has_key(data, 'path') && !empty(data.path)
    if !filereadable(data.path) && !isdirectory(data.path)
      echohl WarningMsg
      echomsg 'Unite: file does not exist: ' .. data.path
      echohl None
      return
    endif
  endif

  api.close()
  if has_key(data, 'path') && !empty(data.path)
    execute 'edit ' .. fnameescape(data.path)
  elseif get(data, 'bufnr', 0) > 0
    execute printf('buffer %d', data.bufnr)
  elseif get(data, 'line', 0) > 0
    execute printf('buffer %d', ctx.origin_bufnr)
  else
    throw 'Unite: open action requires data.path, data.bufnr or data.line'
  endif

  if get(data, 'line', 0) > 0
    cursor(data.line, get(data, 'col', 1))
  endif
enddef

export def SetReg(candidate: dict<any>, ctx: dict<any>, api: dict<any>)
  var data = CandidateData(candidate)
  if has_key(data, 'regcontents')
    setreg('"', data.regcontents, get(data, 'regtype', 'v'))
  else
    setreg('"', get(candidate, 'word', ''))
  endif
  api.close()
enddef

export def Execute(candidate: dict<any>, ctx: dict<any>, api: dict<any>)
  var data = CandidateData(candidate)
  var command = get(data, 'command', '')
  if empty(command)
    throw 'Unite: execute action requires data.command'
  endif
  api.close()
  execute command
enddef
