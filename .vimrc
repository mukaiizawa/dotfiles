" .vimrc

if !has('gui_running')
  if has('win32') || has ('win64')
    colo default
  else
    se t_Co=256
    colo shin-dark-term
  en
en

call plug#begin('~/.vim/plugged')
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'mattn/emmet-vim'
Plug 'mukaiizawa/neoyank.vim'
Plug 'osyo-manga/unite-quickfix'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-fugitive'
Plug 'tyru/caw.vim'
Plug 'tyru/open-browser.vim'
call plug#end()
filetype plugin indent on
sy enable

se ai
se bs=start,eol,indent
se cc=100
se ch=2
se cpt=.,b,u,s~/dotfiles/word/en
se cul
se enc=utf-8
se et
se fdm=marker
se fenc=utf-8
se fencs=utf-8,cp932,sjis,euc-jp,ucs-bom,utf-16le
se ff=unix
se ffs=unix,dos,mac
se fo+=roqjM
se fo-=tc
se hi=2000
se hlg=en
se hls
se ic
se imi=0
se ims=0
se lcs=tab:->,eol:<,trail:>
se list
se ls=2
se nf-=octal
se nobk
se noswf
se noudf
se nowrap
se nu
se popt=wrap:y,number:y
se sc
se scs
se si
se sm
se spr
se stal=2
se stl=%F%#Exception#%m%r%##\ %=\ %{&ft}\ %{status_line#fenc()}\ %{status_line#ff()}\ [%{status_line#row()},\ %{status_line#col()}]
se sw=2
se tal=%t
se title
se tpm=100
se ts=2
se vi=
se wmnu
se ws

ino <C-d> <Esc>:call ec#ino#ctrl_d()<CR>
ino <C-l> <C-n>
ino <Tab> <C-v><Tab>
ino <silent><ESC> <ESC>:set iminsert=0<CR>

nn ( {
nn ) }
nn <C-Insert> "*y
nn <C-d> <NOP>
nn <C-e> <NOP>
nn <C-u> <NOP>
nn <C-y> <NOP>
nn <Del> <NOP>
nn <F1> :windo diffthis<CR>
nn <F2> :windo diffoff!<CR>
nn <F3> :<C-u>e $MYVIMRC<CR>
nn <F4> :<C-u>e $MYGVIMRC<CR>
nn <F5> :<C-u>source $MYVIMRC<CR>
nn <F6> :<C-u>source $MYGVIMRC<CR>
nn <Insert> <NOP>
nn <S-Insert> "*p
nn <Space> <NOP>
nn <Space><Space> zz
nn <Space>j Lzz
nn <Space>k Hzz
nn <silent><Space>h :call ec#nn#h()<CR>
nn <silent><Space>l :call ec#nn#l()<CR>
nn <silent><Space>s :lcd %:h<CR>:vs<CR>:terminal ++curwin<CR>
nn <silent><Space>w :set wrap!<CR>
nn <silent>mm :e #<CR>
nn <silent>sq :<C-u>q<CR>
nn N Nzz
nn * *zz
nn # #zz
nn Q <NOP>
nn U  <C-r>
nn Y y$
nn ZZ <NOP>
nn ch <NOP>
nn cj <NOP>
nn ck <NOP>
nn cl <NOP>
nn dh <NOP>
nn dj <NOP>
nn dk <NOP>
nn dl <NOP>
nn gcd  :<C-u>lcd %:h<CR>:pwd<CR>
nn gf :vs<CR>gF
nn j gj
nn k gk
nn n nzz
nn s  <NOP>
nn sd" f"x,x
nn sd' f'x,x
nn sd( f)xF(x
nn sd) f)xF(x
nn sd* f*x,x
nn sd< f>xF<x
nn sd> f>xF<x
nn sd[ f]xF[x
nn sd] f]xF[x
nn sd` f`x,x
nn sd{ f}xF{x
nn sd} f}xF{x
nn sh <C-w>h
nn sj <C-w>j
nn sk <C-w>k
nn sl <C-w>l
nn sr <C-w>r
nn ss <C-w>s
nn st :<C-u>tabnew<CR>
nn sv <C-w>v
nn zc zM

tno <Esc> <C-w>N

vn ( {
vn ) }
vn / y/<C-r>"<CR>zz
vn <C-Insert> "*y
vn <S-Insert> "*p
vn <Space>h 0
vn <Space>j Lzz
vn <Space>k Hzz
vn <Space>l $
vn gzc :call ec#vn#gzc()<CR>
vn j gj
vn k gk

" unite
let g:html_number_lines = 0
let g:unite_no_default_keymappings = 1
let g:unite_source_rec_min_cache_files = 100
let g:unite_source_rec_max_cache_files = 200
call unite#custom#profile('default', 'context', {
      \   'start_insert': 1,
      \   'no_wrap': 1,
      \   'prompt': '> ',
      \   'marked_icon': '@',
      \   'candidate_icon': '*',
      \   'direction': 'topleft',
      \   'cursor_line_time': '0.0',
      \   'cursor_line_highlight': 'Visual',
      \ })
call unite#custom#default_action('directory', 'vimfiler')
call unite#custom#default_action('source/history/yank', 'setreg')
call unite#custom#source('neomru/file', 'ignore_pattern','**/dict/*.*')

" NeoMRU
let g:neomru#file_mru_limit = 5000
let g:neomru#file_mru_ignore_pattern = '\~$' .
      \ '\|^\%(http[s]\|file\|quickrun\):' .
      \ '\|^\%(//\|\\\\\)' .
      \ '\|\.\%(o\|exe\|dll\|bak\|zwc\|pyc\|sw\)$'
let g:neomru#directory_mru_limit = 500
let g:neomru#directory_mru_ignore_pattern = ''

" vimfiler
let g:loaded_netrwPlugin = 1
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_ignore_pattern = ''
let g:vimfiler_directory_display_top = 1
let g:vimfiler_tree_leaf_icon = '|'
let g:vimfiler_tree_opened_icon = '-'
let g:vimfiler_tree_closed_icon = '+'
let g:vimfiler_file_icon = ' '
let g:vimfiler_readonly_file_icon = 'X'
let g:vimfiler_marked_file_icon = '*'
let g:vimfiler_tree_indentation = 1
call vimfiler#custom#profile('default', 'context', {
      \   'safe': 0,
      \   'auto-expand': 1,
      \   'auto-cd': 1,
      \   'find': 1,
      \   'status': 1,
      \ })

" quickrun
let g:quickrun_no_default_key_mappings = 1
let g:quickrun_config = {
      \   '_': {
      \     'split': 'vertical',
      \     'outputter/buffer/close_on_empty':1
      \   },
      \   'c': {
      \     'hook/time/enable': 1,
      \     'type': executable('clang')? 'c/clang':
      \             executable('gcc')? 'c/gcc': '',
      \   },
      \   'cs': {
      \     'runmode': 'simple',
      \     'command': 'csc',
      \     'exec': [
      \        '%c /nologo %s > nul'
      \        , '%s:p:r.exe %a'
      \        , ':call delete("%S:p:r.exe")'
      \     ],
      \     'tempfile': '{tempname()}.cs',
      \   },
      \   'java': {
      \     'exec': [
      \       'javac -J-Dfile.encoding=UTF8 %o %s'
      \       , '%c -ea -Dfile.encoding=UTF8 %s:t:r %a'
      \     ],
      \     'hook/time/enable': 1,
      \   },
      \   'javascript': {
      \     'command': 'cscript',
      \     'exec': '%c %s',
      \   },
      \   'lisp': {
      \     'type': executable('sbcl')? 'lisp/sbcl':
      \             executable('lx86cl64')? 'lisp/ccll':
      \             executable('wx86cl64')? 'lisp/cclw':
      \             executable('clisp')? 'lisp/clisp': '',
      \     'hook/time/enable': 1,
      \   },
      \   'lisp/sbcl': {
      \     'command': 'sbcl',
      \     'exec': '%c --noinform --non-interactive --load %s',
      \   },
      \   'lisp/ccll': {
      \     'command': 'lx86cl64',
      \     'exec': '%c -K utf8 -l %s -e "(ccl:quit)"',
      \   },
      \   'lisp/cclw': {
      \     'command': 'wx86cl64',
      \     'exec': '%c -K utf8 -l %s -e "(ccl:quit)"',
      \   },
      \   'lisp/clisp': {
      \     'command': 'clisp',
      \   },
      \   'markdown': {
      \     'command': 'paren',
      \     'input': '%{expand("%:p")}',
      \     'outputter': 'file',
      \     'outputter/file/name': '%{expand("%:r")}.html',
      \     'exec': '%c md2html.p',
      \   },
      \   'paren': {
      \     'command': 'paren',
      \     'exec': '%c %s',
      \   },
      \ }

" caw
let g:caw_no_default_keymappings = 1

" emmet
let g:user_emmet_settings = {
      \   'variables': {
      \     'lang': 'ja',
      \   },
      \   'html': {
      \     'indentation': '    ',
      \     'quote_char': "'",
      \     'expandos': {
      \       'ol': 'ol>li',
      \       'ul': 'ul>li',
      \       'table': 'table>thead>tr>th*3^^tbody>tr>td*3',
      \     },
      \     'default_attributes': {
      \       'a': {'href': ''},
      \     },
      \   },
      \   'java': {
      \     'snippets': {
      \       '!': "public static void main(String[] args) {\n\t|\n}",
      \       'class': "public class | {\n}",
      \       'main': "public static void main(String[] args) {\n\t|\n}",
      \       'if': "if (|) {\n}",
      \       'fori': "for (int i = 0; i < |; i++) {\n}",
      \       'forj': "for (int j = 0; j < |; j++) {\n}",
      \       'fork': "for (int k = 0; k < |; k++) {\n}",
      \       'while': "while (|) {\n}",
      \       'switch': "switch (|) {\n\tcase xxx:\n\t\tbreak;\n\tdefault:\n\t\tbreak;\n}",
      \     }
      \   },
      \   'jsp': {
      \     'expandos': {
      \       'c:choose': 'c:choose>c:when,c:otherwise',
      \     },
      \     'default_attributes': {
      \       'c:forEach': [{'var': ''}, {'items': '${|}'}, {'varStatus': 'status'}, ],
      \       'c:if': {'test': '${|}'},
      \       'c:out': {'value': '${|}'},
      \       'c:set': [{'var': ''}, {'value': '${|}'}, ],
      \       'c:when': {'test': '${|}'},
      \     },
      \   },
      \   'paren': {
      \     'snippets': {
      \       'main': "(function! main (args)\n  (write :hello-world))",
      \     }
      \   },
      \   'python': {
      \     'snippets': {
      \       'main': "if __name__ == '__main__':|"
      \     }
      \   },
      \   'sql': {
      \     'snippets': {
      \       'case': "case\n  when | then expr\n  else expr\nend",
      \     },
      \   },
      \ }

" quickfix
let g:unite_quickfix_filename_is_pathshorten = 0
let g:unite_quickfix_is_multiline = 0

" plugin mapping
nm gca <Plug>(caw:dollarpos:toggle)
nm gcc <Plug>(caw:wrap:toggle)
nm gci <Plug>(caw:hatpos:toggle)
nm gw  <Plug>(openbrowser-open)
nm gww <Plug>(openbrowser-search)
vm gca <Plug>(caw:dollarpos:toggle)
vm gcc <Plug>(caw:wrap:toggle)
vm gci <Plug>(caw:hatpos:toggle)
vm gw  <Plug>(openbrowser-open)
vm gww <Plug>(openbrowser-search)

nn <silent>mb :<C-u>Unite bookmark<CR>
nn <silent>md :<C-u>NeoMRUReload<CR>:Unite directory_mru<CR>
nn <silent>me :<C-u>Unite menu<CR> 
nn <silent>mf :<C-u>VimFilerBufferDir -create<CR>
nn <silent>mh :<C-u>Unite help -no-wrap -no-empty -horizontal<CR>
nn <silent>mk :<C-u>Unite file_mru<CR>
nn <silent>mr :<C-u>Unite history/yank -default-action=setreg<CR>
nn <silent>ml :<C-u>Unite line -no-wrap<CR>
nn <silent>mq :<C-u>lcd %:h<CR> :QuickRun<CR>
nn <silent>mx :<C-u>Unite quickfix<CR>

nn sp :<C-u>PutPrintFunction<CR>
vn sp :PutPrintFunction<CR>

" autocmd
aug vimrc
  au!
  au TerminalOpen * setl nonu
aug END
