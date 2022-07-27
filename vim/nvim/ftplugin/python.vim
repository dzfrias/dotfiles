setlocal shiftwidth=4
setlocal softtabstop=4
setlocal colorcolumn=79

" Correct some spelling
iabbrev <buffer> slef self
iabbrev <buffer> sefl self

" Put pprint at the top of the file
command! -buffer Pprint normal! mpggOfrom pprint import pprint<Esc>`pdmp
" Delete first line in a file
command! -buffer Dprint normal! mpggdd`pdmp

" Treesitter doesn't always load, so this makes sure it does
if exists('g:treesitter_bad_load')
  autocmd VimEnter * edit
endif
setlocal foldmethod=expr
setlocal foldexpr=nvim_treesitter#foldexpr()
