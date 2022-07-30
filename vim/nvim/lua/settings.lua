local set = vim.o

set.hidden = true

set.writebackup = false
set.backup = false

set.relativenumber = true

set.signcolumn = 'number'

set.hlsearch = true

vim.cmd[[set colorcolumn=80]]
vim.cmd[[highlight ColorColumn ctermbg=0 guibg=lightgrey]]

set.cmdheight = 2

set.wrap = false

set.shortmess = set.shortmess .. 'c'

set.background = 'dark'

set.guicursor = 'c:ver20,i:ver20,ci:ver20,cr:ver20'

set.updatetime = 100

set.clipboard = 'unnamed'

set.foldmethod = 'indent'
set.foldlevelstart = 2
set.foldnestmax = 1

set.autoindent = true
set.smartindent = true
set.expandtab = true

set.modeline = true
set.modelines = 1
