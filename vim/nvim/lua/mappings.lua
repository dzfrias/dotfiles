util = require('util')
-- Set up map functions
nnoremap = util.nnoremap
inoremap = util.inoremap
noremap = util.noremap
xnoremap = util.xnoremap

-- Go to top of file and first character
noremap('gg', 'gg0')

-- Fold movement down
noremap('<s-j>', 'zj')
-- Open fold
noremap('<space>', 'za')

-- Go to last place in insert mode
noremap('gi', 'gi<Esc>')

-- Better wrapped line movement
noremap('k', 'gk')
noremap('j', 'gj')
noremap('0', 'g0')
noremap('$', 'g$')

-- Make a newline
nnoremap('<CR>', 'o<Esc>')

-- Basic command mappings
nnoremap('<leader>w', '<Cmd>write<CR>')
nnoremap('<leader>s', '<Cmd>source %<CR>')
nnoremap('<leader>q', '<Cmd>quit!<CR>')
nnoremap('<leader>e', '<Cmd>write<CR><Cmd>source $MYVIMRC<CR>')

-- Telescope
nnoremap('<leader>tf', '<Cmd>ProjFiles<CR>') -- See commands.lua for ProjFiles
nnoremap('<leader>tl', '<Cmd>ProjLines<CR>') -- See commands.lua for ProjLines
nnoremap('<leader>tt', '<Cmd>Telescope lsp_document_symbols<CR>')

-- Trouble
nnoremap('<leader>x', '<Cmd>TroubleToggle<CR>')

-- Open NvimTree
nnoremap('<C-n>', '<Cmd>NvimTreeToggle<CR>')

-- Git mappings
nnoremap('gq', '<Cmd>Git<CR>')
nnoremap('gcm', '<Cmd>write<CR><Cmd>Git add --all <bar> Git commit --verbose<CR>')
nnoremap('gp', '<Cmd>Git push<CR>')

-- Window movement
nnoremap('<leader>k', '<C-w>k')
nnoremap('<leader>l', '<C-w>l')
nnoremap('<leader>h', '<C-w>h')
nnoremap('<leader>j', '<C-w>j')

-- Run file
nnoremap('<leader>r', '<Cmd>write<CR><Cmd>RunFile float<CR>')

-- Escape
inoremap('jk', '<Esc>')
