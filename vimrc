filetype off
call pathogen#runtime_append_all_bundles()

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set modelines=0

let mapleader = ","

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set encoding=utf-8
set nobackup
set nowritebackup
set hidden

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set showmode
set showmatch  " show matching brackets
set cursorline
set ttyfast
set laststatus=2 " Always display the status line
set scrolloff=3

if version >= 730
  set relativenumber
  set undofile
  set colorcolumn=85
endif

" Display extra whitespace
set list listchars=tab:»·,trail:·,eol:¬
" Toggle listchars
map <Leader>l :set list! <CR>

" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set wildmenu
set completeopt=longest,menu
set wildmode=list:longest,list:full
set complete=.,t

set ignorecase
set smartcase
set gdefault
set incsearch		" do incremental searching
nnoremap / /\v
vnoremap / /\v

" Hide search highlighting
map <Leader>h :set invhls <CR>

" Softtabs, 2 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set wrap
set textwidth=78
set formatoptions=crqn1

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap j gj
nnoremap k gk

nnoremap ; :
inoremap kj <esc>

" Don't use Ex mode, use Q for formatting
map Q gq

nnoremap <leader>q gqip
"nnoremap <leader>v V`]

nnoremap <leader>w <C-w>v<C-w>l

nnoremap <leader>a :Ack 

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  "autocmd FileType text,mkd setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  autocmd FocusLost * :wa

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

if has("folding")
  set foldenable
  set foldmethod=syntax
  set foldlevel=1
  set foldnestmax=3
  set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\ '.substitute(getline(v:foldend),'^[\ #]*','','g').'\ '

  nnoremap <space> za
endif


" Functions for working with tabs and spaces (from
" http://vimcasts.org/episodes/tabs-and-spaces/)

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

" Function to preserve state (from
" http://vimcasts.org/episodes/tidying-whitespace/)
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

nmap <Leader>$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap <Leader>= :call Preserve("normal gg=G")<CR>

command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis


" Store this session
"map <Leader>ss :mksession! ~/work-session.vim

" Edit the README_FOR_APP (makes :R commands work)
"map <Leader>R :e doc/README_FOR_APP<CR>

" Leader shortcuts for Rails commands
"map <Leader>m :Rmodel
"map <Leader>c :Rcontroller
"map <Leader>v :Rview
"map <Leader>u :Runittest
"map <Leader>f :Rfunctionaltest
"map <Leader>tm :RTmodel
"map <Leader>tc :RTcontroller
"map <Leader>tv :RTview
"map <Leader>tu :RTunittest
"map <Leader>tf :RTfunctionaltest
"map <Leader>sm :RSmodel
"map <Leader>sc :RScontroller
"map <Leader>sv :RSview
"map <Leader>su :RSunittest
"map <Leader>sf :RSfunctionaltest

" Spell checking
nmap <silent> <Leader>s :set spell! <CR>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
"if has('gui_win32')
  "map <Leader>e :e <C-R>=expand("%:p:h") . "\\" <CR>
"else
  "map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
"end

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
"if has('gui_win32')
  "map <Leader>te :tabe <C-R>=expand("%:p:h") . "\\" <CR>
"else
  "map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
"end

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
"if has('gui_win32')
"  cmap <C-P> <C-R>=expand("%:p:h") . "\\" <CR>
"else
"  cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
"end
" Maps autocomplete to tab
"imap <Tab> <C-N>

" Duplicate a selection
" Visual mode: D
vmap D y'>p

" For Haml
"au! BufRead,BufNewFile *.haml         setfiletype haml

" No Help, please
nmap <F1> <Esc>

" Press ^F from insert mode to insert the current file name
imap <C-F> <C-R>=expand("%")<CR>

" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
vmap P p :call setreg('"', getreg('0')) <CR>


" Edit routes
"command! Rroutes :e config/routes.rb
"command! RTroutes :tabe config/routes.rb

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif

" Use Ack instead of Grep when available
"if executable("ack")
"  set grepprg=ack\ -H\ --nogroup\ --nocolor
"elseif executable("ack.pl")
"  set grepprg=ack.pl\ -H\ --nogroup\ --nocolor
"endif

" Color scheme
colorscheme twilight
"highlight NonText guibg=#060606
"highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Numbers
set number
set numberwidth=4

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Tags
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

