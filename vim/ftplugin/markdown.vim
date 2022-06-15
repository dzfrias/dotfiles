" These four settings will soft wrap text at the width of the screen
set textwidth=0
set wrapmargin=0
set wrap
set linebreak

" Underlines incorrectly spelled words
set spell

" Horizontal traversal
noremap + 30l
noremap - 30h
" The four below make wrapped lines easier to traverse
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$

let callcmd='open ' . @%
