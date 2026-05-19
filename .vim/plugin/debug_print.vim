vim9script

const PRINT_WRAPPERS = {
  c: ['printf("%d\n", ', ');'],
  cpp: ['std::cout << "', '";'],
  cs: ['Debug.Log(', ');'],
  dosbatch: ['echo "', '"'],
  html: ['console.log(', ');'],
  java: ['System.out.println(', ');'],
  javascript: ['console.log(', ');'],
  jsp: ['console.log(', ');'],
  lisp: ['(print ', ')'],
  paren: ['(write ', ')'],
  peal: ['print ', ';'],
  python: ['print(', ')'],
  ruby: ['puts "', '"'],
  rust: ['println!("{}", ', ');'],
  vb: ['Debug.Print ', ''],
  vim: ['echo ', ''],
  xhtml: ['console.log(', ');'],
}

def GetLineBody(line_number: number): string
  return matchstr(getline(line_number), '\S.*')
enddef

def IsWrapped(text: string, left_part: string, right_part: string): bool
  if text[: strlen(left_part) - 1] !=# left_part
    return false
  endif
  if empty(right_part)
    return true
  endif
  return text[-strlen(right_part) : ] ==# right_part
enddef

def ToggleWrapper(text: string, left_part: string, right_part: string): string
  if !IsWrapped(text, left_part, right_part)
    return left_part .. text .. right_part
  endif
  var start_index = strlen(left_part)
  if empty(right_part)
    return text[start_index : ]
  endif
  var end_index = strlen(text) - strlen(right_part) - 1
  return text[start_index : end_index]
enddef

def RewriteLine(line_number: number, left_part: string, right_part: string)
  setline(line_number, ToggleWrapper(GetLineBody(line_number), left_part, right_part))
  cursor(line_number, 1)
  execute 'normal! =='
enddef

def DebugPrint(first_line: number, last_line: number)
  if !has_key(PRINT_WRAPPERS, &filetype)
    echo "This file type isn't supported."
    return
  endif
  var [left_part, right_part] = PRINT_WRAPPERS[&filetype]
  for line_number in range(first_line, last_line)
    RewriteLine(line_number, left_part, right_part)
  endfor
enddef

command -range DebugPrint DebugPrint(<line1>, <line2>)
