" .vimrc

if !has('gui_running')
  if has('win32') || has ('win64')
    colorscheme default
  else
    set t_Co=256
    colorscheme shin-dark-term
  endif
endif

call plug#begin('~/.vim/plugged')
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'mattn/emmet-vim'
Plug 'mukaiizawa/neoyank.vim'
Plug 'osyo-manga/unite-quickfix'
Plug 'thinca/vim-quickrun'
Plug 'tyru/caw.vim'
call plug#end()
filetype plugin indent on
syntax enable

set autoindent
set backspace=start,eol,indent
set colorcolumn=100
set cmdheight=2
set complete=.,b,u,s~/dotfiles/word/en
set cursorline
set encoding=utf-8
set expandtab
set foldmethod=marker
set fileencoding=utf-8
set fileencodings=utf-8,cp932,sjis,euc-jp,ucs-bom,utf-16le
set fileformat=unix
set fileformats=unix,dos,mac
set formatoptions+=roqjM
set formatoptions-=tc
set history=2000
set helplang=en
set hlsearch
set ignorecase
set iminsert=0
set imsearch=0
set listchars=tab:->,eol:<,trail:>
set list
set laststatus=2
set nrformats-=octal
set nobackup
set noswapfile
set noundofile
set nowrap
set number
set printoptions=wrap:y,number:y
set showcmd
set smartcase
set smartindent
set showmatch
set splitright
set showtabline=2
set statusline=%!status_line#Build()
set shiftwidth=2
set tabline=%t
set title
set tabpagemax=100
set tabstop=2
set viminfo=
set wildmenu
set wrapscan

inoremap <C-d> <Esc>:call editor_commands#insert#CtrlD()<CR>
inoremap <C-l> <C-n>
inoremap <Tab> <C-v><Tab>
inoremap <silent><ESC> <ESC>:set iminsert=0<CR>

nnoremap ( {
nnoremap ) }
nnoremap <C-Insert> "*y
nnoremap <C-d> <NOP>
nnoremap <C-e> <NOP>
nnoremap <C-u> <NOP>
nnoremap <C-y> <NOP>
nnoremap <Del> <NOP>
nnoremap <F1> :windo diffthis<CR>
nnoremap <F2> :windo diffoff!<CR>
nnoremap <F3> :<C-u>e $MYVIMRC<CR>
nnoremap <F4> :<C-u>e $MYGVIMRC<CR>
nnoremap <F5> :<C-u>source $MYVIMRC<CR>
nnoremap <F6> :<C-u>source $MYGVIMRC<CR>
nnoremap <Insert> <NOP>
nnoremap <S-Insert> "*p
nnoremap <Space> <NOP>
nnoremap <Space><Space> zz
nnoremap <Space>j Lzz
nnoremap <Space>k Hzz
nnoremap <silent><Space>h :call editor_commands#normal#H()<CR>
nnoremap <silent><Space>l :call editor_commands#normal#L()<CR>
nnoremap <silent><Space>s :lcd %:h<CR>:vs<CR>:terminal ++curwin<CR>
nnoremap <silent><Space>w :set wrap!<CR>
nnoremap <silent>mm :e #<CR>
nnoremap <silent>sq :<C-u>q<CR>
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap Q <NOP>
nnoremap U  <C-r>
nnoremap Y y$
nnoremap ZZ <NOP>
nnoremap ch <NOP>
nnoremap cj <NOP>
nnoremap ck <NOP>
nnoremap cl <NOP>
nnoremap dh <NOP>
nnoremap dj <NOP>
nnoremap dk <NOP>
nnoremap dl <NOP>
nnoremap gcd  :<C-u>lcd %:h<CR>:pwd<CR>
nnoremap gf :vs<CR>gF
nnoremap j gj
nnoremap k gk
nnoremap n nzz
nnoremap s  <NOP>
nnoremap sd" f"x,x
nnoremap sd' f'x,x
nnoremap sd( f)xF(x
nnoremap sd) f)xF(x
nnoremap sd* f*x,x
nnoremap sd< f>xF<x
nnoremap sd> f>xF<x
nnoremap sd[ f]xF[x
nnoremap sd] f]xF[x
nnoremap sd` f`x,x
nnoremap sd{ f}xF{x
nnoremap sd} f}xF{x
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sr <C-w>r
nnoremap ss <C-w>s
nnoremap st :<C-u>tabnew<CR>
nnoremap sv <C-w>v
nnoremap zc zM

tnoremap <Esc> <C-w>N

vnoremap ( {
vnoremap ) }
vnoremap / y/<C-r>"<CR>zz
vnoremap <C-Insert> "*y
vnoremap <S-Insert> "*p
vnoremap <Space>h 0
vnoremap <Space>j Lzz
vnoremap <Space>k Hzz
vnoremap <Space>l $
vnoremap gzc :<C-u>call editor_commands#visual#Gzc()<CR>
vnoremap j gj
vnoremap k gk

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
nmap gca <Plug>(caw:dollarpos:toggle)
nmap gcc <Plug>(caw:wrap:toggle)
nmap gci <Plug>(caw:hatpos:toggle)
vmap gca <Plug>(caw:dollarpos:toggle)
vmap gcc <Plug>(caw:wrap:toggle)
vmap gci <Plug>(caw:hatpos:toggle)

nnoremap <silent>mb :<C-u>Unite bookmark<CR>
nnoremap <silent>md :<C-u>NeoMRUReload<CR>:Unite directory_mru<CR>
nnoremap <silent>me :<C-u>Unite menu<CR> 
nnoremap <silent>mf :<C-u>VimFilerBufferDir -create<CR>
nnoremap <silent>mh :<C-u>Unite help -no-wrap -no-empty -horizontal<CR>
nnoremap <silent>mk :<C-u>Unite file_mru<CR>
nnoremap <silent>mr :<C-u>Unite history/yank -default-action=setreg<CR>
nnoremap <silent>ml :<C-u>Unite line -no-wrap<CR>
nnoremap <silent>mq :<C-u>lcd %:h<CR> :QuickRun<CR>
nnoremap <silent>mx :<C-u>Unite quickfix<CR>

nnoremap sp :<C-u>PutPrintFunction<CR>
vnoremap sp :PutPrintFunction<CR>

" autocmd
augroup vimrc
  autocmd!
  autocmd TerminalOpen * setlocal nonumber
augroup END
