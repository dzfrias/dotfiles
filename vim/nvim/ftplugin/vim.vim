" Disable " autopairs (used for comments)
let b:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '`':'`'}

" Treesitter doesn't always load, so this makes sure it does
if exists('g:treesitter_bad_load')
  autocmd VimEnter * edit
endif
setlocal foldmethod=expr
setlocal foldexpr=nvim_treesitter#foldexpr()
