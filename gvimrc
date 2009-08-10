" Font
if has('gui_mac')
  set guifont=Monaco:h10.00
elseif has('gui_gtk2')
  set guifont=Dejavu\s Sans\ Mono\ 11
elseif has('gui_win32')
  set guifont=Consolas:h10:cANSI
elseif has('x11')
  set guifont=-*-dejavu-medium-r-normal-*-*-110-*-*-m-*-*
endif

" No audible bell
set vb

" No toolbar
set guioptions-=T

" Use console dialogs
set guioptions+=c

" Local config
if filereadable(".gvimrc.local")
  source .gvimrc.local
endif

" Make sure session saves GUI size and position
set sessionoptions+=resize,winpos
