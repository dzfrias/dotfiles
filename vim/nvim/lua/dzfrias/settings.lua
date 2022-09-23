local set = vim.o

-- No backups
set.writebackup = false
set.backup = false

-- Number settings
set.relativenumber = true
set.number = true

-- Merge signcolumn with the number column
set.signcolumn = 'yes'

-- Highlight search matches
set.hlsearch = true

-- Color column
set.colorcolumn = '80'
vim.cmd [[highlight ColorColumn ctermbg=0 guibg=lightgrey]]

--  Lines to use for the command line
set.cmdheight = 2

-- Don't wrap lines
set.wrap = false

vim.opt.shortmess:append { c = true }

-- For colors
set.background = 'dark'

-- Line cursor in insert and command mode
set.guicursor = 'c:ver20,i:ver20,ci:ver20,cr:ver20'

-- Updating time, useful for plugins
set.updatetime = 100

-- Use system clipboard
set.clipboard = 'unnamed'

-- Indent based on folds
set.foldmethod = 'indent'
set.foldlevelstart = 2
-- Max 1 fold level
set.foldnestmax = 1
-- Don't open folds with block movement ('{' and '}')
set.foldopen = set.foldopen:gsub('block,', '')

-- Indentation
set.autoindent = true
set.smartindent = true
set.expandtab = true

set.modeline = true
-- Only one modeline allowed
set.modelines = 1

-- Completion window max items
set.pumheight = 5

-- Spelling
set.spell = true

set.splitright = true

set.completeopt = 'menu,menuone,noselect'

set.ignorecase = true
set.smartcase = true

vim.g.mapleader = ' '

set.conceallevel = 2
