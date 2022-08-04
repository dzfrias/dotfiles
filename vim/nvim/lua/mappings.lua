-- Helper functions
local function nmap(shortcut, command)
  vim.api.nvim_set_keymap('n', shortcut, command, { noremap = true })
end

local function imap(shortcut, command)
  vim.api.nvim_set_keymap('i', shortcut, command, { noremap = true })
end

local function map(shortcut, command)
  vim.api.nvim_set_keymap('', shortcut, command, { noremap = true })
end

-- Go to top of file and first character
map('gg', 'gg0')

-- Fold movement down
map('<s-j>', 'zj')
-- Open fold
map('<space>', 'za')

-- Go to last place in insert mode
map('gi', 'gi<Esc>')

-- Tab movement
map('<C-l>', '<Cmd>tabn<CR>')
map('<C-h>', '<Cmd>tabp<CR>')

-- Better wrapped line movement
map('k', 'gk')
map('j', 'gj')
map('0', 'g0')
map('$', 'g$')

-- Make a newline
nmap('<CR>', 'o<Esc>')

-- Basic command mappings
nmap('<leader>w', '<Cmd>write<CR>')
nmap('<leader>s', '<Cmd>source %<CR>')
nmap('<leader>q', '<Cmd>quit!<CR>')
nmap('<leader>e', '<Cmd>write<CR><Cmd>source $MYVIMRC<CR>')

-- Re-edit file, also loading the entire runtime
nmap('<leader>v', '<Cmd>Runtime<CR><Cmd>edit<CR>')

-- Telescope
nmap('<leader>tf', '<Cmd>ProjFiles<CR>') -- See commands.lua for ProjFiles
nmap('<leader>tt', '<Cmd>Telescope lsp_document_symbols<CR>')
nmap('<leader>tl', '<Cmd>Telescope live_grep<CR>')

-- Trouble
nmap('<leader>x', '<Cmd>TroubleToggle<CR>')

-- Open NvimTree
nmap('<C-n>', '<Cmd>NvimTreeToggle<CR>')

-- Git mappings
nmap('gq', '<Cmd>Git<CR>')
nmap('gcm', '<Cmd>Git add --all <bar> Git commit --verbose<CR>')
nmap('gp', '<Cmd>Git push<CR>')

-- Vimspector launch settings, see all in plugins/vimspector.lua
nmap('<leader>du', '<Cmd>call vimspector#LaunchWithSettings(#{configuration: "test"})<CR>')
nmap('<leader>dd', '<Cmd>call vimspector#LaunchWithSettings(#{configuration: "run"})<CR>')

-- Window movement
nmap('<leader>k', '<C-w>k')
nmap('<leader>l', '<C-w>l')
nmap('<leader>h', '<C-w>h')
nmap('<leader>j', '<C-w>j')

-- Run file
nmap('<leader>r', '<Cmd>write<CR><Cmd>RunFile float<CR>')

-- Escape
imap('jk', '<Esc>')

-- Tab movement
imap('<C-l>', '<Esc><Cmd>tabn<CR>')
imap('<C-h>', '<Esc><Cmd>tabp<CR>')

vim.cmd [[
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
]]
