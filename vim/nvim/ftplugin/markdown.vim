" Soft wrap text at the width of the screen
setlocal textwidth=0
setlocal wrapmargin=0
setlocal wrap
setlocal linebreak

" Underline incorrectly spelled words
setlocal spell

" Horizontal traversal
noremap <buffer> + 30l
noremap <buffer> - 30h
" Make wrapped lines easier to traverse
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$

let b:callcmd='open ' . @%

nnoremap <buffer> <silent> <leader>t :setlocal filetype=help<CR>
