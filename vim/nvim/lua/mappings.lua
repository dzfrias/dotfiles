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


map('gg', 'gg0')

map('<s-j>', 'zj')
map('<space>', 'za')

map('gi', 'gi<Esc>')

map('<C-l>', '<Cmd>tabn<CR>')
map('<C-h>', '<Cmd>tabp<CR>')

map('k', 'gk')
map('j', 'gj')
map('0', 'g0')
map('$', 'g$')

nmap('<CR>', 'o<Esc>')
nmap('<leader>w', '<Cmd>write<CR>')
nmap('<leader>s', '<Cmd>source %<CR>')
nmap('<leader>q', '<Cmd>quit!<CR>')
nmap('<leader>e', '<Cmd>write<CR><Cmd>source $MYVIMRC<CR>')

nmap('<leader>v', '<Cmd>Runtime<CR><Cmd>edit<CR>')

nmap('<leader>f', '<Cmd>ProjFiles<CR>')

nmap('<C-n>', '<Cmd>NERDTreeToggle<CR>')

nmap('gq', '<Cmd>Git<CR>')
nmap('gcm', '<Cmd>Git add --all <bar> Git commit --verbose<CR>')
nmap('gp', '<Cmd>Git push<CR>')

imap('jk', '<Esc>')

nmap('<leader>du', '<Cmd>call vimspector#LaunchWithSettings(#{configuration: "test"})<CR>')
nmap('<leader>dd', '<Cmd>call vimspector#LaunchWithSettings(#{configuration: "run"})<CR>')

nmap('<C-f>', '<Cmd>HopWord<CR>')

nmap('<leader>k', '<C-w>k')
nmap('<leader>l', '<C-w>l')
nmap('<leader>h', '<C-w>h')
nmap('<leader>j', '<C-w>j')

nmap('<leader>r', '<Cmd>w<CR><Cmd>lua require("FTerm").run({vim.b.callcmd, "&&", "read -n 1 && exit"})<CR>')

imap('<C-l>', '<Esc><Cmd>tabn<CR>')
imap('<C-h>', '<Esc><Cmd>tabp<CR>')
