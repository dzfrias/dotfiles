" vim-go
nnoremap <buffer> <leader>r  :w<CR>:GoRun<CR>
nnoremap <buffer> <C-p>      <Plug>(go-doc)
nnoremap <buffer> <leader>c  <Plug>(go-coverage-toggle)

" Gojson
nnoremap <buffer> <leader>g  <Plug>Gojson
nnoremap <buffer> <leader>gg <Plug>GojsonLine
xnoremap <buffer> <leader>g  <Plug>Gojson

setlocal foldmethod=expr
setlocal foldexpr=nvim_treesitter#foldexpr()
