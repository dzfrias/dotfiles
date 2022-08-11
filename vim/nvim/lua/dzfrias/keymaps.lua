local util = require 'dzfrias/util'
-- Set up map functions
local nnoremap = util.nnoremap
local inoremap = util.inoremap
local noremap = util.noremap
local xnoremap = util.xnoremap

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

-- Make a newline
nnoremap('<CR>', 'o<Esc>')

-- Basic command mappings
nnoremap('<leader>w', '<Cmd>write<CR>')
nnoremap('<leader>s', '<Cmd>source %<CR>')
nnoremap('<leader>q', '<Cmd>quit!<CR>')
nnoremap('<leader>e', '<Cmd>edit<CR>')

-- Reload config
nnoremap('<leader>R', '<Cmd>Reload<CR>') -- See commands.lua for Reload

-- Telescope
local tel = require 'telescope.builtin'
nnoremap('<leader>tf', function()
  tel.find_files { cwd = util.get_project_root() }
end)
nnoremap('<leader>tl', function()
  tel.live_grep { cwd = util.get_project_root() }
end)
nnoremap('<leader>tt', tel.lsp_document_symbols)
nnoremap('<leader>tr', tel.lsp_references)
nnoremap('<leader>tk', tel.keymaps)

-- Trouble
nnoremap('<leader>x', require('trouble').toggle)

-- Git mappings
nnoremap('gq', '<Cmd>Git<CR>')
nnoremap('gcm', function()
  vim.cmd [[
  write
  Git add --all
  Git commit --verbose
  ]]
end)
nnoremap('gp', '<Cmd>Git push<CR>')
-- Hunk mappings
local gs = require 'gitsigns'
nnoremap('gh', gs.preview_hunk)
nnoremap('gr', gs.reset_hunk)
nnoremap('gD', function()
  gs.setqflist 'all'
end)

-- Leap
nnoremap('gs', '<Plug>(leap-forward)')
nnoremap('gS', '<Plug>(leap-backward)')
xnoremap('gs', '<Plug>(leap-forward)')
xnoremap('gS', '<Plug>(leap-backward)')

-- Neotest
local neotest = require 'neotest'
nnoremap('<leader>ur', function()
  neotest.run.run(vim.fn.expand '%')
end)
nnoremap('<leader>uR', function()
  neotest.run.run(util.get_project_root())
end)
nnoremap('<leader>uo', function()
  neotest.output.open()
end)
nnoremap('<leader>us', function()
  neotest.summary.toggle()
end)

-- Escape
inoremap('jk', '<Esc>')
