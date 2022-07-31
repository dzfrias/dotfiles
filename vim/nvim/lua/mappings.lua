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

-- Fzf files at the project root, see ProjFiles in commands.lua
nmap('<leader>f', '<Cmd>ProjFiles<CR>')

-- Open NERDTree
nmap('<C-n>', '<Cmd>NERDTreeToggle<CR>')

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

-- Open floating terminal and run call callcmd on file
nmap('<leader>r', '<Cmd>w<CR><Cmd>lua require("FTerm").run({vim.b.callcmd, "&&", "read -n 1 && exit"})<CR>')

-- Escape
imap('jk', '<Esc>')

-- Tab movement
imap('<C-l>', '<Esc><Cmd>tabn<CR>')
imap('<C-h>', '<Esc><Cmd>tabp<CR>')

-- Accept copilot suggestion
vim.cmd('imap <silent><script><expr> <C-l> copilot#Accept("<CR>")')
