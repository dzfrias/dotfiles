" These four settings will soft wrap text at the width of the screen
setlocal textwidth=0
setlocal wrapmargin=0
setlocal wrap
setlocal linebreak

" Underlines incorrectly spelled words
setlocal spell

" Horizontal traversal
noremap <buffer> + 30l
noremap <buffer> - 30h
" The four below make wrapped lines easier to traverse
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$

let b:callcmd='open ' . @%
