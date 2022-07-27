function! s:ToggleDebugger() abort
  if maparg('b', 'n') !=? '<Plug>(go-debug-breakpoint)'
    execute 'GoDebugStart'
  else
    execute 'GoDebugStop'
  endif
endfunction

" vim-go
nnoremap <buffer> <leader>r  :w<CR>:GoRun<CR>
nnoremap <buffer> <C-p>      <Plug>(go-doc)
nnoremap <buffer> <leader>c  <Plug>(go-coverage-toggle)

" Gojson
nnoremap <buffer> <leader>g  <Plug>Gojson
nnoremap <buffer> <leader>gg <Plug>GojsonLine
xnoremap <buffer> <leader>g  <Plug>Gojson

" Treesitter doesn't always load, so this makes sure it does
if exists('g:treesitter_bad_load')
  autocmd VimEnter * edit
endif
setlocal foldmethod=expr
setlocal foldexpr=nvim_treesitter#foldexpr()
