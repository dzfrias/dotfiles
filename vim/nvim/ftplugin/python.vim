setlocal shiftwidth=4
setlocal softtabstop=4
setlocal colorcolumn=79

" Correct some spelling
iabbrev <buffer> slef self
iabbrev <buffer> sefl self

" Put pprint at the top of the file
command! Pprint normal mpggOfrom pprint import pprintjk`pdmp
" Delete first line in a file
command! Dprint normal mpggdd`pdmp

" Lint on save
autocmd BufWritePre * :execute 'PymodeLintAuto'
