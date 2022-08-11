local bufnoremap = require('dzfrias/util').bufnoremap

bufnoremap('n', '<leader>n', ':edit %')
bufnoremap('n', '<leader>r', ':Shdo mv {}')
bufnoremap('n', '<leader>d', '<Cmd>Shdo rm {}<CR>', { nowait = true })
bufnoremap('n', '<leader>s', ':Shdo ')
