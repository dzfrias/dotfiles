local util = require 'dzfrias.util'
-- Set up map functions
local nnoremap = util.nnoremap
local inoremap = util.inoremap
local noremap = util.noremap

noremap('gg', 'gg0', 'Top of file and first character')

noremap('<space><space>', 'za', 'Open fold')

noremap('gi', 'gi<Esc>', 'Last place in insert mode')

noremap('k', 'gk', 'Move down')
noremap('j', 'gj', 'Move up')

-- Window resizing
nnoremap('<C-s-l>', '<Cmd>vertical resize -5<CR>', 'Resize window left')
nnoremap('<C-s-h>', '<Cmd>vertical resize +5<CR>', 'Resize window right')
nnoremap('<C-s-j>', '<Cmd>horizontal resize +2<CR>', 'Resize window down')
nnoremap('<C-s-k>', '<Cmd>horizontal resize -2<CR>', 'Resize window up')

nnoremap('<CR>', 'o<Esc>', 'Make a newline')
nnoremap('<s-CR>', 'O<Esc>', 'Make a newline upwards')

-- Basic command mappings
nnoremap('<leader>w', '<Cmd>write<CR>', 'Write file')
nnoremap('<leader>q', '<Cmd>quit!<CR>', 'Quit file')

inoremap('jk', '<Esc>', 'Escape')
