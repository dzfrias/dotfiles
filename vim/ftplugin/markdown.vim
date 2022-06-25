" These four settings will soft wrap text at the width of the screen
setlocal textwidth=0
setlocal wrapmargin=0
setlocal wrap
setlocal linebreak

" Underlines incorrectly spelled words
setlocal spell

" Horizontal traversal
noremap + 30l
noremap - 30h
" The four below make wrapped lines easier to traverse
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$

let b:callcmd='open ' . @%
