vim9script

export def IsSudo(): bool
  return $SUDO_USER !=# '' || $USER ==# 'root'
enddef

export def CacheBaseDir(): string
  return unite#path#ExpandPath($XDG_CACHE_HOME != '' ? $XDG_CACHE_HOME .. '/unite' : '~/.cache/unite')
enddef

export def UniqCaseInsensitive(items: list<string>): list<string>
  var result: list<string> = []
  var seen: dict<bool> = {}
  for item in items
    if empty(item)
      continue
    endif
    var key = tolower(item)
    if has_key(seen, key)
      continue
    endif
    seen[key] = true
    add(result, item)
  endfor
  return result
enddef

export def WriteList(path: string, lines: list<any>)
  mkdir(fnamemodify(path, ':h'), 'p')
  writefile(mapnew(copy(lines), (_, v) => type(v) == v:t_string ? v : string(v)), path)
enddef

def Normalize(store: dict<any>)
  store.items = UniqCaseInsensitive(store.items)
  if len(store.items) > store.limit
    store.items = store.items[: store.limit - 1]
  endif
enddef

export def NewCacheListStore(path: string, limit: number, Validator: func(list<string>): list<string>): dict<any>
  return {
    path: unite#path#ExpandPath(path),
    limit: limit,
    Validator: Validator,
    items: [],
    mtime: 0,
    is_loaded: false,
  }
enddef

export def HasExternalUpdate(store: dict<any>): bool
  return store.mtime < getftime(store.path)
enddef

export def Validate(store: dict<any>)
  store.items = store.Validator(copy(store.items))
enddef

export def Load(store: dict<any>, force: bool = false)
  if !force && store.is_loaded && !HasExternalUpdate(store)
    return
  endif
  if force
    store.items = []
    store.is_loaded = false
  endif
  if !filereadable(store.path)
    return
  endif

  extend(store.items, readfile(store.path))
  Normalize(store)
  store.mtime = getftime(store.path)
  store.is_loaded = true
enddef

export def Reload(store: dict<any>)
  Load(store, true)
  Validate(store)
enddef

export def Save(store: dict<any>)
  if IsSudo()
    return
  endif
  if HasExternalUpdate(store) && filereadable(store.path)
    extend(store.items, readfile(store.path))
  endif
  Normalize(store)
  WriteList(store.path, store.items)
  store.mtime = getftime(store.path)
  store.is_loaded = true
enddef

export def Append(store: dict<any>, item: string)
  Load(store)
  var i = 0
  while i < len(store.items)
    if tolower(store.items[i]) ==# tolower(item)
      if i == 0
        return
      endif
      remove(store.items, i)
      break
    endif
    i += 1
  endwhile
  insert(store.items, item, 0)
  Normalize(store)
  Save(store)
enddef

export def Entries(store: dict<any>): list<string>
  Load(store)
  return copy(store.items)
enddef
