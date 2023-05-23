local util = require 'dzfrias/util'
-- Set up map functions
local nnoremap = util.nnoremap
local inoremap = util.inoremap
local noremap = util.noremap

-- Go to top of file and first character
noremap('gg', 'gg0')

-- Open fold
noremap('<space><space>', 'za')

-- Go to last place in insert mode
noremap('gi', 'gi<Esc>')

-- Better wrapped line movement
noremap('k', 'gk')
noremap('j', 'gj')

-- Window resizing
nnoremap('<C-s-l>', '<Cmd>vertical resize -5<CR>')
nnoremap('<C-s-h>', '<Cmd>vertical resize +5<CR>')
nnoremap('<C-s-j>', '<Cmd>horizontal resize +2<CR>')
nnoremap('<C-s-k>', '<Cmd>horizontal resize -2<CR>')

nnoremap('<C-a>', '<C-^>')

-- Make a newline
nnoremap('<CR>', 'o<Esc>')
nnoremap('<s-CR>', 'O<Esc>')

-- Basic command mappings
nnoremap('<leader>w', '<Cmd>write<CR>')
nnoremap('<leader>q', '<Cmd>quit!<CR>')

-- Escape
inoremap('jk', '<Esc>')
