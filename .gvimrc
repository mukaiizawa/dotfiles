" .gvimrc

se go-=m
se go-=T
se go-=r
se go-=R
se go-=l
se go-=L
se go-=b
se go+=c
se vb t_vb=

colo shin-dark
sy on

se mouse-=a
se nomousef
se mh

if has('win32') || has ('win64')
  au GUIEnter * simalt ~x
  se gfn=Iosevka_Fixed_Slab_Medium:h12,Consolas:h12,MS_Gothic:h12
  se lsp=1
  se ambw=double
elsei has("mac")
  se gfn=Monaco:h14
elsei has("unix")
  se gfn=DejaVu\ Sans\ Mono\ 10.5
en
