" Disable " autopairs (used for comments)
let b:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '`':'`'}

if expand('%') =~? 'init.vim'
  normal! zM
endif

setlocal foldmethod=expr
setlocal foldexpr=nvim_treesitter#foldexpr()
