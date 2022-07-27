" Disable " autopairs (used for comments)
let b:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '`':'`'}

setlocal foldmethod=expr
setlocal foldexpr=nvim_treesitter#foldexpr()
