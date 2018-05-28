if v:version < 800
  finish
endif

if exists('g:loaded_beautivim')
  finish
endif

let g:loaded_beautivim = 1

let s:plugin_root = fnamemodify(expand("<sfile>"), ":h")

func! BeautiviHtml(...)
  let path = expand("%:p")
  let result = system(fnameescape(s:plugin_root."/js-beautify/js/bin/html-beautify.js")." -f ".path)
  let lines = split(result, "\n", 1)
  silent exec "0,".line("$")."j"
  call setline(1, lines[0])
  call append(1, lines[1:])
endfun

func! BeautiviJs(...)
  let path = expand("%:p")
  let result = system(fnameescape(s:plugin_root."/js-beautify/js/bin/js-beautify.js")." -f ".path)
  let lines = split(result, "\n", 1)
  silent exec "0,".line("$")."j"
  call setline(1, lines[0])
  call append(1, lines[1:])
endfun

func! BeautiviCss(...)
  let path = expand("%:p")
  let result = system(fnameescape(s:plugin_root."/js-beautify/js/bin/css-beautify.js")." -f ".path)
  let lines = split(result, "\n", 1)
  silent exec "0,".line("$")."j"
  call setline(1, lines[0])
  call append(1, lines[1:])
endfun

autocmd! BufWrite *.html call BeautiviHtml()
autocmd! BufWrite *.css call BeautiviCss()
autocmd! BufWrite *.js call BeautiviJs()
