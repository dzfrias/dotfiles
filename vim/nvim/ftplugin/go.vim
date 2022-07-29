" vim-go
nnoremap <buffer> <leader>r  <Cmd>w<CR><Cmd>GoRun<CR>
nnoremap <buffer> <leader>t  <Cmd>w<CR><Cmd>GoTest<CR>
nnoremap <buffer> <C-p>      <Plug>(go-doc)
nnoremap <buffer> <leader>c  <Plug>(go-coverage-toggle)

" Gojson
nnoremap <buffer> <leader>g  <Plug>Gojson
nnoremap <buffer> <leader>gg <Plug>GojsonLine
xnoremap <buffer> <leader>g  <Plug>Gojson

setlocal foldmethod=expr
setlocal foldexpr=nvim_treesitter#foldexpr()
