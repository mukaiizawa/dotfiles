vim9script

# Keep the existing .,b,u,s{file} sources; dictionary entries are whole lines.
def SourceLines(info: dict<any>): list<string>
  if info.loaded
    return getbufline(info.bufnr, 1, '$')
  endif
  return filereadable(info.name) ? readfile(info.name) : []
enddef

export def Complete(findstart: number, base: string): any
  if findstart
    return match(strpart(getline('.'), 0, col('.') - 1), '\k*$')
  endif
  var candidates: list<string> = []
  var seen: dict<bool> = {}
  var sources = split(&complete, ',')
  var pattern = '\c^' .. escape(base, '\.*$^~[')
  if !&ignorecase || (&smartcase && base =~# '\u')
    pattern = '\C^' .. escape(base, '\.*$^~[')
  endif
  for source in sources
    var entries: list<string> = []
    if index(['.', 'b', 'u'], source) >= 0
      for info in getbufinfo()
        if (source ==# '.' && info.bufnr == bufnr())
            || (source ==# 'b' && info.listed && info.loaded && info.bufnr != bufnr())
            || (source ==# 'u' && info.listed && !info.loaded)
          for text in SourceLines(info)
            extend(entries, split(text, '\k\@!.'))
          endfor
        endif
      endfor
    elseif source =~# '^s.'
      for path in glob(expand(source[1 :]), false, true)
        if filereadable(path)
          extend(entries, readfile(path))
        endif
      endfor
    endif
    for entry in entries
      if entry !=# '' && entry =~ pattern && !has_key(seen, entry)
        seen[entry] = true
        add(candidates, entry)
      endif
    endfor
  endfor
  return candidates
enddef

export def Previous(): string
  return complete_info(['selected']).selected == 0 ? "\<C-p>\<C-p>" : "\<C-p>"
enddef

export def Start(backward: bool): string
  if pumvisible() || complete_info(['mode']).mode !=# ''
    return backward ? "\<C-p>" : "\<C-n>"
  endif
  return "\<C-x>\<C-u>" .. (backward ? "\<C-r>=word_complete#Previous()\<CR>" : '')
enddef
