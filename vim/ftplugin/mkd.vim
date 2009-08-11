" mkd.vim
"
" Lukas Toth

setlocal ai formatoptions=tcroqn1 comments=n:>
setlocal textwidth=78

command! -nargs=0 MarkdownRenderFile call MarkdownRenderBufferToFile()
command! -nargs=0 MarkdownRenderTab call MarkdownRenderBufferToTab()
command! -nargs=0 MarkdownPreview call MarkdownRenderBufferToPreview()
noremap <buffer> <Leader>rp :MarkdownPreview<CR>
noremap <buffer> <Leader>rf :MarkdownRenderFile<CR>
noremap <buffer> <Leader>rt :MarkdownRenderTab<CR>
setlocal ignorecase
setlocal wrap
setlocal lbr

function! MarkdownRender(lines)
  if (system('which perl') == "")
    throw "Could not find perl!"
  end

  if (system('which Markdown.pl') == "")
    throw "Could not find Markdown!"
  end

  "let text = join(a:lines, "\n")
  "let html = system("Markdown.pl", text)
  let temp = writefile(a:lines,"markdown-input.txt")
  let html = system("Markdown.pl markdown-input.txt")
  return html
endfunction

function! MarkdownRenderFile(lines, filename)
  let html = MarkdownRender(getbufline(bufname("%"), 1, '$'))
  let html = "<html><head><title>" . bufname("%") . "</title><body>\n" . html . "\n</body></html>"
  return writefile(split(html, "\n"), a:filename)
endfunction

function! MarkdownRenderBufferToPreview()
  let filename = "markdown-preview.html"
  call MarkdownRenderFile(getbufline(bufname("%"), 1, '$'), filename)

  if has('gui_macvim')
    call system("open -a Safari ". filename)
  elseif has('gui_gtk2')
  elseif has('gui_win32')
    call system("rundll32 url.dll,FileProtocolHandler ". filename)
  elseif has('x11')
  endif
endfunction

function! MarkdownRenderBufferToFile()
  let filename = input("Filename:", substitute(bufname("%"), "\(txt\|mkd\)$", "html", ""), "file")
  call MarkdownRenderFile(getbufline(bufname("%"), 1, '$'), filename)
  echo "Rendered to '" . filename . "'"
endfunction

function! MarkdownRenderBufferToTab()
  let html = MarkdownRender(getbufline(bufname("%"), 1, '$'))
  tabnew
  call append("^", split(html, "\n"))
  set syntax=html
endfunction

