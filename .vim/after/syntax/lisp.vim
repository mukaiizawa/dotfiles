

"  macro-utils
"  {{{

syn keyword lispFunc with-gensyms
syn keyword lispFunc with-encoding
syn keyword lispFunc canonical-letargs
syn keyword lispFunc alambda
syn keyword lispFunc dlambda
syn keyword lispFunc olambda
syn keyword lispFunc surround
syn keyword lispFunc dostring
syn keyword lispFunc while
syn keyword lispFunc for
syn keyword lispFunc abbrev
syn keyword lispFunc abbrevs
syn keyword lispFunc s-expr

" abbrevs function
syn keyword lispFunc dbind
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
syn keyword lispFunc each-line


" }}}

" sequential
" {{{

syn keyword lispFunc before
syn keyword lispFunc after


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
syn keyword lispFunc alistp
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

" for html
" {{{
syn keyword lispFunc a
syn keyword lispFunc abbr
syn keyword lispFunc acronym
syn keyword lispFunc address
syn keyword lispFunc applet
syn keyword lispFunc area
syn keyword lispFunc article
syn keyword lispFunc aside
syn keyword lispFunc audio
syn keyword lispFunc b
syn keyword lispFunc base
syn keyword lispFunc basefont
syn keyword lispFunc bdi
syn keyword lispFunc bdo
syn keyword lispFunc big
syn keyword lispFunc blockquote
syn keyword lispFunc body
syn keyword lispFunc br
syn keyword lispFunc button
syn keyword lispFunc canvas
syn keyword lispFunc caption
syn keyword lispFunc center
syn keyword lispFunc cite
syn keyword lispFunc code
syn keyword lispFunc col
syn keyword lispFunc colgroup
syn keyword lispFunc datalist
syn keyword lispFunc dd
syn keyword lispFunc del
syn keyword lispFunc details
syn keyword lispFunc dfn
syn keyword lispFunc dialog
syn keyword lispFunc dir
syn keyword lispFunc div
syn keyword lispFunc dl
syn keyword lispFunc dt
syn keyword lispFunc em
syn keyword lispFunc embed
syn keyword lispFunc fieldset
syn keyword lispFunc figcaption
syn keyword lispFunc figure
syn keyword lispFunc font
syn keyword lispFunc footer
syn keyword lispFunc form
syn keyword lispFunc frame
syn keyword lispFunc frameset
syn keyword lispFunc h1
syn keyword lispFunc h2
syn keyword lispFunc h3
syn keyword lispFunc h4
syn keyword lispFunc h5
syn keyword lispFunc h6
syn keyword lispFunc head
syn keyword lispFunc header
syn keyword lispFunc hr
syn keyword lispFunc html
syn keyword lispFunc i
syn keyword lispFunc iframe
syn keyword lispFunc img
syn keyword lispFunc input
syn keyword lispFunc ins
syn keyword lispFunc kbd
syn keyword lispFunc keygen
syn keyword lispFunc label
syn keyword lispFunc legend
syn keyword lispFunc li
syn keyword lispFunc link
syn keyword lispFunc main
syn keyword lispFunc mark
syn keyword lispFunc menu
syn keyword lispFunc menuitem
syn keyword lispFunc meta
syn keyword lispFunc meter
syn keyword lispFunc nav
syn keyword lispFunc noframes
syn keyword lispFunc noscript
syn keyword lispFunc object
syn keyword lispFunc ol
syn keyword lispFunc optgroup
syn keyword lispFunc option
syn keyword lispFunc output
syn keyword lispFunc p
syn keyword lispFunc param
syn keyword lispFunc pre
syn keyword lispFunc progress
syn keyword lispFunc q
syn keyword lispFunc rp
syn keyword lispFunc rt
syn keyword lispFunc ruby
syn keyword lispFunc s
syn keyword lispFunc samp
syn keyword lispFunc script
syn keyword lispFunc section
syn keyword lispFunc select
syn keyword lispFunc small
syn keyword lispFunc source
syn keyword lispFunc span
syn keyword lispFunc strike
syn keyword lispFunc strong
syn keyword lispFunc style
syn keyword lispFunc sub
syn keyword lispFunc summary
syn keyword lispFunc sup
syn keyword lispFunc table
syn keyword lispFunc tbody
syn keyword lispFunc td
syn keyword lispFunc textarea
syn keyword lispFunc tfoot
syn keyword lispFunc th
syn keyword lispFunc thead
syn keyword lispFunc title
syn keyword lispFunc tr
syn keyword lispFunc track
syn keyword lispFunc tt
syn keyword lispFunc u
syn keyword lispFunc ul
syn keyword lispFunc var
syn keyword lispFunc video
syn keyword lispFunc wbr


" }}}


