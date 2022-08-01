require('neoscroll').setup { hide_cursor = false }

local t = {}
t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '150'}}
t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '150'}}

require('neoscroll.config').set_mappings(t)
