local bufnoremap = require('dzfrias/util').bufnoremap

if vim.fn.expand('%'):find 'plugins.lua' then
  vim.cmd 'normal! zM'
end

-- Run the current file
bufnoremap('n', '<leader>r', ':luafile %<CR>')
