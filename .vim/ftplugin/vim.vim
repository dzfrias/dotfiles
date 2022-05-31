" Highlights comments with dashes around them
syntax match sectionHeader '\v" *-.+-'
highlight link sectionHeader HighlightComment

" Traverses sectionHeaders
noremap <silent> ‘ /\v" -.+-<CR>:noh<CR>
noremap <silent> “ ?\v" -.+-<CR>:noh<CR>

" Fixes comments, might cause problems later
iabbrev # "
