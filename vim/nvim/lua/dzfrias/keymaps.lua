local util = require 'dzfrias/util'
-- Set up map functions
local nnoremap = util.nnoremap
local inoremap = util.inoremap
local noremap = util.noremap

-- Go to top of file and first character
noremap('gg', 'gg0')

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

nnoremap('-', require('oil').open)

-- Make a newline
nnoremap('<CR>', 'o<Esc>')
nnoremap('<s-CR>', 'O<Esc>')

-- Basic command mappings
nnoremap('<leader>w', '<Cmd>write<CR>')
nnoremap('<leader>q', '<Cmd>quit!<CR>')

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
nnoremap('<leader>th', tel.help_tags)
nnoremap('<leader>tb', tel.buffers)

-- Trouble
nnoremap('<leader>x', '<Cmd>TroubleToggle workspace_diagnostics<CR>')

-- Git mappings
nnoremap('<leader>g', '<Cmd>LazyGit<CR>')
local gs = require 'gitsigns'
nnoremap('gp', gs.preview_hunk)
nnoremap('gr', gs.reset_hunk)
nnoremap('gD', gs.setqflist)
nnoremap('g]', gs.next_hunk)
nnoremap('g[', gs.prev_hunk)

-- Neotest
local neotest = require 'neotest'
nnoremap('<leader>uu', function()
  neotest.run.run(vim.fn.expand '%')
end)
nnoremap('<leader>uo', function()
  neotest.output.open()
end)
nnoremap('<leader>us', function()
  neotest.summary.toggle()
  vim.cmd 'wincmd l'
end)

-- Harpoon
local harpoon_ui = require 'harpoon.ui'
nnoremap('<leader>mm', require('harpoon.mark').add_file)
nnoremap('<leader>mo', harpoon_ui.toggle_quick_menu)
nnoremap('<leader>mn', harpoon_ui.nav_next)
nnoremap('<leader>mp', harpoon_ui.nav_prev)

-- Escape
inoremap('jk', '<Esc>')

-- luasnip
local luasnip = require 'luasnip'
vim.keymap.set('i', '<C-j>', function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<C-k>', function()
  luasnip.jump(-1)
end, { silent = true })

vim.keymap.set('s', '<C-j>', function()
  luasnip.jump(1)
end, { silent = true })
