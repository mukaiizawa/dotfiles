

"  macro-utils
"  {{{

syn keyword lispFunc with-gensyms
syn keyword lispFunc with-encoding
syn keyword lispFunc surround
syn keyword lispFunc dostring
syn keyword lispFunc while
syn keyword lispFunc for
syn keyword lispFunc abbrev
syn keyword lispFunc abbrevs
syn keyword lispFunc s-expr

" abbrevs function
syn keyword lispFunc mvl
syn keyword lispFunc hash-size
syn keyword lispFunc mkhash

" }}}

" anaphoric macros
" {{{

syn keyword lispFunc aif
syn keyword lispFunc awhen
syn keyword lispFunc awhile
syn keyword lispFunc aand
syn keyword lispFunc acond
syn keyword lispFunc dcond
syn keyword lispFunc alambda
syn keyword lispFunc each-line

" }}}

" sequential
" {{{

syn keyword lispFunc before
syn keyword lispFunc after
syn keyword lispFunc lastelt

" }}}

" logical function
" {{{

syn keyword lispFunc fn-if
syn keyword lispFunc fn-and
syn keyword lispFunc fn-or

" }}}

" list utils
" {{{

syn keyword lispFunc last1
syn keyword lispFunc singlep
syn keyword lispFunc append1
syn keyword lispFunc conc1
syn keyword lispFunc mklist
syn keyword lispFunc iota
syn keyword lispFunc longerp
syn keyword lispFunc filter
syn keyword lispFunc group
syn keyword lispFunc flatten
syn keyword lispFunc prune
syn keyword lispFunc find2
syn keyword lispFunc beforep
syn keyword lispFunc afterp
syn keyword lispFunc last-member
syn keyword lispFunc most
syn keyword lispFunc convert-tree

" }}}

" functional utils
" {{{

syn keyword lispFunc map0-n
syn keyword lispFunc map1-n
syn keyword lispFunc mapa-b
syn keyword lispFunc maprec
syn keyword lispFunc memoize
syn keyword lispFunc compose
syn keyword lispFunc repeat

" }}}

" string utils
" {{{

syn keyword lispFunc emptyp
syn keyword lispFunc blankp
syn keyword lispFunc mkstr
syn keyword lispFunc mksym
syn keyword lispFunc explode
syn keyword lispFunc string->list
syn keyword lispFunc list->string
syn keyword lispFunc string->byte
syn keyword lispFunc byte->string
syn keyword lispFunc replstr
syn keyword lispFunc trimstr
syn keyword lispFunc format-string

" }}}

" io utils
" {{{
syn keyword lispFunc encoding
syn keyword lispFunc guess-encoding
syn keyword lispFunc stdin
syn keyword lispFunc stdout
syn keyword lispFunc show-hash
syn keyword lispFunc princln
syn keyword lispFunc println
syn keyword lispFunc echo
syn keyword lispFunc info
syn keyword lispFunc input-int
syn keyword lispFunc input-str
syn keyword lispFunc input-char
syn keyword lispFunc input-list

" }}}

" file utils
" {{{

syn keyword lispFunc dir-pathname-p
syn keyword lispFunc pathname-as-directory
syn keyword lispFunc directory-wildcard
syn keyword lispFunc file-exists-p
syn keyword lispFunc pathname-as-file
syn keyword lispFunc parent-directory
syn keyword lispFunc read-from
syn keyword lispFunc write-to
syn keyword lispFunc mkdir
syn keyword lispFunc mkfile
syn keyword lispFunc ls
syn keyword lispFunc mapfile

" }}}

" for application
" {{{
syn keyword lispFunc parse-int
syn keyword lispFunc parse-sym
syn keyword lispFunc getopt
syn keyword lispFunc parse-args
syn keyword lispFunc defexe
syn keyword lispFunc executable
syn keyword lispFunc exit
syn keyword lispFunc call
syn keyword lispFunc args
syn keyword lispFunc usage

" }}}

" keyword
" {{{

syn keyword lispKey :extension
syn keyword lispKey :external-format
syn keyword lispKey :enc :utf-8 :uft-16 :cp932 :euc-jp
syn keyword lispKey :ff :unix :windows :CR :CRLF
syn keyword lispKey :print-object
syn keyword lispKey :vector
syn keyword lispKey :capitalize
syn keyword lispKey :recursive
syn keyword lispKey :left :right :float :padding
syn keyword lispKey :title :desc :opts :foot

" }}}

