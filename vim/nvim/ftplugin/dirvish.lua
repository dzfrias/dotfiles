local bufnoremap = require('dzfrias/util').bufnoremap

bufnoremap('n', '<leader>n', ':edit %')
vim.api.nvim_set_keymap('n', '<leader>r', ':Shdo mv {} ', {})
