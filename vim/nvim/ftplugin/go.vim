let b:callcmd='go run ' . @%

nnoremap <buffer> <C-p> <Plug>(go-doc)
" Gojson
nnoremap <leader>g      <Plug>Gojson
nnoremap <leader>gg     <Plug>Gojson
xnoremap <leader>g      <Plug>Gojson

setlocal foldmethod=syntax
