" Font
if has('gui_macvim')
  set guifont=Droid\ Sans\ Mono\ Slashed:h10.00
  set fuoptions=maxvert,maxhorz
  set linespace=2
elseif has('gui_gtk2')
  set guifont=Dejavu\s Sans\ Mono\ 11
elseif has('gui_win32')
  set guifont=Droid_Sans_Mono_Slashed:h10:cANSI
elseif has('x11')
  set guifont=-*-dejavu-medium-r-normal-*-*-110-*-*-m-*-*
endif

" No audible bell
set visualbell

" Don't blink the cursor
set guicursor=a:blinkon0

" No toolbar
set guioptions-=T

" Use console dialogs
set guioptions+=c

" Display extra whitespace
set list listchars=tab:»·,trail:·,eol:¬

" Local config
if filereadable(".gvimrc.local")
  source .gvimrc.local
endif

" Make sure session saves GUI size and position
set sessionoptions+=resize,winpos
