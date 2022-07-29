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

let b:callcmd='open ' . @%

nnoremap <buffer> <silent> <leader>t <Cmd>setlocal filetype=help<CR>
