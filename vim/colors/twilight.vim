
set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "twilight"

let s:grey_blue = '#7587a5'
let s:light_grey_blue = '#a0a8b0'
let s:dark_grey_blue = '#1a1a1a'
let s:mid_grey_blue = '#5e5960'
let s:beige = '#cda869'
let s:light_orange = '#ebc471'
let s:yellow = '#f9ed97'
let s:violet = '#9a859c'
let s:green = '#8e9c69'
let s:lightgreen = '#daefa3'
let s:red = '#cf694b'
let s:cyan = '#74dad9'
let s:darkgrey = '#131313'
let s:grey = '#202020'
let s:lightgrey = '#899a95'
let s:white = '#f7f7f7'
let s:brown = '#9a703f'
let s:orange = '#cf7c34'
let s:lightorange = '#e8bf62'
let s:lightblue = '#afc3db'

if version >= 700
  hi CursorLine guibg=#202020
  hi CursorColumn guibg=#202020
  hi MatchParen guifg=#f9ed97 guibg=#282828 gui=bold

  "Tabpages
  hi TabLine guifg=#a09998 guibg=#202020 gui=underline
  hi TabLineFill guifg=#a09998 guibg=#202020 gui=underline
  hi TabLineSel guifg=#a09998 guibg=#404850 gui=underline

  "P-Menu (auto-completion)
  hi Pmenu guifg=#5e5960 guibg=#1a1a1a
  hi PmenuSel guifg=#899a95 guibg=#202020
  "PmenuSbar
  "PmenuThumb
endif

hi Visual guibg=#282828

"hi Cursor guifg=NONE guibg=#586068
hi Cursor guibg=#a7a7a7

exe 'hi Normal         guifg='.s:white             .' guibg='.s:darkgrey
exe 'hi Underlined     guifg='.s:grey_blue             .' guibg='.s:darkgrey        .' gui=underline'
exe 'hi NonText        guifg='.s:grey         .' guibg='.s:darkgrey
exe 'hi SpecialKey     guifg='.s:grey              .' guibg='.s:darkgrey

exe 'hi LineNr         guifg='.s:mid_grey_blue     .' guibg='.s:dark_grey_blue  .' gui=none'
exe 'hi StatusLine     guifg='.s:white             .' guibg='.s:grey            .' gui=italic'
exe 'hi StatusLineNC   guifg='.s:mid_grey_blue         .' guibg='.s:grey            .' gui=italic'
exe 'hi VertSplit      guifg='.s:grey              .' guibg='.s:grey            .' gui=none'

exe 'hi Folded         guifg='.s:grey_blue         .' guibg='.s:dark_grey_blue  .' gui=none'
exe 'hi FoldColumn     guifg='.s:grey_blue         .' guibg='.s:dark_grey_blue  .' gui=none'
exe 'hi SignColumn     guifg='.s:grey_blue         .' guibg='.s:dark_grey_blue  .' gui=none'

exe 'hi Comment        guifg='.s:mid_grey_blue     .' guibg='.s:darkgrey        .' gui=italic'
exe 'hi TODO           guifg='.s:yellow         .' guibg='.s:darkgrey        .' gui=italic,bold'

exe 'hi Title          guifg='.s:red               .' guibg='.s:darkgrey        .' gui=none'

exe 'hi Constant       guifg='.s:red               .' guibg='.s:darkgrey        .' gui=none'
exe 'hi String         guifg='.s:green             .' guibg='.s:darkgrey        .' gui=none'
exe 'hi Special        guifg='.s:lightgreen        .' guibg='.s:darkgrey        .' gui=none'
exe 'hi Regexp        guifg='.s:lightorange        .' guibg='.s:darkgrey        .' gui=none'

exe 'hi Identifier     guifg='.s:grey_blue         .' guibg='.s:darkgrey        .' gui=none'
exe 'hi Statement      guifg='.s:beige             .' guibg='.s:darkgrey        .' gui=none'
exe 'hi Conditional    guifg='.s:beige             .' guibg='.s:darkgrey        .' gui=none'
exe 'hi Repeat         guifg='.s:beige             .' guibg='.s:darkgrey        .' gui=none'
exe 'hi Structure      guifg='.s:beige             .' guibg='.s:darkgrey        .' gui=none'
exe 'hi Function       guifg='.s:brown            .' guibg='.s:darkgrey        .' gui=none'

exe 'hi PreProc        guifg='.s:lightblue         .' guibg='.s:darkgrey        .' gui=none'
exe 'hi Operator       guifg='.s:light_orange      .' guibg='.s:darkgrey        .' gui=none'
exe 'hi Type           guifg='.s:violet            .' guibg='.s:darkgrey        .' gui=italic'

"hi Identifier guifg=#7587a6
" Type d: 'class'
"hi Structure guifg=#9B859D gui=underline
"hi Function guifg=#dad085
" dylan: method, library, ... d: if, return, ...
"hi Statement guifg=#7187a1 gui=NONE
" Keywords  d: import, module...
"hi PreProc guifg=#8fbfdc
"gui=underline
"hi Operator guifg=#a07020
"hi Repeat guifg=#906040 gui=underline
"hi Type guifg=#708090

"hi Type guifg=#f9ee98 gui=NONE

"hi NonText guifg=#808080 guibg=#303030

"hi Macro guifg=#a0b0c0 gui=underline

"Tabs, trailing spaces, etc (lcs)
"hi SpecialKey guifg=#808080 guibg=#343434

"hi TooLong guibg=#ff0000 guifg=#f8f8f8

hi Search guifg=#606000 guibg=#c0c000 gui=bold

hi Directory guifg=#dad085 gui=NONE
hi Error guibg=#602020

