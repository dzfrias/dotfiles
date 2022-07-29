setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2

" For the Jinja2 template engine
inoremap <buffer> {% {%  %}<ESC>hhi

" Trigger emmet autocomplete
inoremap <buffer> <C-v> <Plug>(emmet-expand-abbr)
nnoremap <buffer> <C-v> <Plug>(emmet-expand-abbr)
