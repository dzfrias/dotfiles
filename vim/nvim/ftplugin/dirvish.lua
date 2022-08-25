local bufnoremap = require('dzfrias/util').bufnoremap

bufnoremap('n', '<leader>n', ':!touch %')
bufnoremap('n', '<leader>d', ':!mkdir %')
bufnoremap('n', '<leader>e', ':edit %')
bufnoremap('n', '<leader>m', ':Shdo mv {}')
bufnoremap('n', '<leader>r', '<Cmd>Shdo rm {}<CR>', { nowait = true })
bufnoremap('n', '<leader>s', ':Shdo ')
bufnoremap('n', 'q', '<Plug>(dirvish_quit)')
