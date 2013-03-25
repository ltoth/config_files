filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

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

set history=500		" keep 500 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set showmode
set showmatch  " show matching brackets
set ttyfast
set laststatus=2 " Always display the status line
set scrolloff=3
set statusline=%f%<\ %h%w%m%r[%L][%{&ff}]%y
if exists("g:loaded_syntastic_plugin")
  set statusline+=%#Error#%{SyntasticStatuslineFlag()}%*
endif
if exists('g:loaded_fugitive') || &cp
  set statusline+=%{fugitive#statusline()}
endif
set statusline+=%=%-14.(%l,%c%V%)\ %P

if version >= 703
  set relativenumber
  set undofile
endif

" Toggle listchars
nnoremap <Leader>l :set list! <CR>

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
nnoremap <Leader>h :set invhls <CR>

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

nnoremap j gj
nnoremap k gk

nnoremap ; :
nnoremap \ ;

" In normal mode, use <C-m> and <C-p> to switch tabs like Pentadactyl or Vrome
" instead of the standard mapping which is j and k
nnoremap <C-n> gt
nnoremap <C-p> gT

" In command-line mode, use <C-m> and <C-p> to go down and up in history
" instead of the standard mapping which is j and k
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

" Don't use Ex mode, use Q for formatting
noremap Q gq

nnoremap <leader>q gqip

nnoremap <leader>w <C-w>v<C-w>l

nnoremap <leader>a :Ack 

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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

nnoremap <Leader>$ :call Preserve("%s/\\s\\+$//e")<CR>
nnoremap <Leader>= :call Preserve("normal gg=G")<CR>

" Spell checking
nnoremap <silent> <Leader>s :set spell! <CR>

" No Help, please
nmap <F1> <Esc>

" Press ^F from insert mode to insert the current file name
inoremap <C-F> <C-R>=expand("%")<CR>

" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
vnoremap P p :call setreg('"', getreg('0')) <CR>

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif

" Color scheme
colorscheme twilight

" Numbers
set number
set numberwidth=4

" NERDTree settings
nnoremap <Leader>d :NERDTreeToggle<CR>
nnoremap <Leader>D :NERDTreeFind<CR>

" NERDCommenter settings
let NERDSpaceDelims=1

" Syntastic plugin settings
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_quiet_warnings=1

" Taglist settings
nnoremap <silent> <Leader>g :TlistToggle<CR>

" Commant-T settings
let g:CommandTMatchWindowAtTop = 1

