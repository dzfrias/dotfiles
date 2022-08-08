local util = require 'util'
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
nnoremap('<leader>e', '<Cmd>write<CR><Cmd>source $MYVIMRC<CR>')

-- Telescope
local tel = require 'telescope.builtin'
nnoremap('<leader>tf', function()
  tel.find_files { cwd = util.get_project_root() }
end)
nnoremap('<leader>tl', function()
  tel.live_grep { cwd = util.get_project_root() }
end)
nnoremap('<leader>tt', tel.lsp_document_symbols)

-- Trouble
nnoremap('<leader>x', require('trouble').toggle)

-- Open NvimTree
nnoremap('<C-n>', require('nvim-tree.api').tree.toggle)

-- Git mappings
function commit_all()
  vim.cmd [[
  write
  Git add --all
  Git commit --verbose
  ]]
  -- Reset staged if commit message was not edited
  vim.api.nvim_create_autocmd('BufLeave', {
    group = vim.api.nvim_create_augroup('commit', { clear = true }),
    buffer = 0,
    callback = function()
      if vim.fn.getbufinfo(vim.fn.bufnr())[1].changed == 0 then
        vim.cmd 'Git reset'
      end
    end,
  })
end

nnoremap('gq', '<Cmd>Git<CR>')
nnoremap('gcm', commit_all)
nnoremap('gp', '<Cmd>Git push<CR>')
-- Hunk mappings
local gs = require 'gitsigns'
nnoremap('gh', gs.preview_hunk)
nnoremap('gr', gs.reset_hunk)

-- Dashboard
nnoremap('<leader>b', '<Cmd>Startify<CR>')

-- Window movement
nnoremap('<leader>k', '<C-w>k')
nnoremap('<leader>l', '<C-w>l')
nnoremap('<leader>h', '<C-w>h')
nnoremap('<leader>j', '<C-w>j')

-- Run file
nnoremap('<leader>r', '<Cmd>write<CR><Cmd>RunFile float<CR>')

-- Escape
inoremap('jk', '<Esc>')
