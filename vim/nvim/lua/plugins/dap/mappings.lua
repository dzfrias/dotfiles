local util = require 'util'
-- Set up map functions
local nnoremap = util.nnoremap
local xnoremap = util.xnoremap

-- Run configuration
nnoremap('<leader>dd', '<Cmd>lua require("dap").continue()<CR>')

-- Quit
nnoremap('<leader>dq', '<Cmd>lua require("dap").terminate()<CR>')

-- Continue to breakpoint or start debugging if no session is active
nnoremap('<leader>dc', '<Cmd>lua require("dap").continue()<CR>')
-- Continue backwards until breakpoint
nnoremap('<leader>dC', '<Cmd>lua require("dap").reverse_continue()<CR>')

-- Breakpoints
nnoremap('<leader>dt', '<Cmd>lua require("dap").toggle_breakpoint()<CR>')

-- Movement and navigation
nnoremap('<leader>dl', '<Cmd>lua require("dap").step_into()<CR>')
nnoremap('<leader>dh', '<Cmd>lua require("dap").step_out()<CR>')
nnoremap('<leader>dj', '<Cmd>lua require("dap").step_over()<CR>')
nnoremap('<leader>dk', '<Cmd>lua require("dap").step_back()<CR>')

-- Misc
nnoremap('<leader>dz', '<Cmd>lua require("dap").run_to_cursor()<CR>')
nnoremap('<leader>di', '<Cmd>lua require("dapui").eval()<CR>')
xnoremap('<leader>di', '<Cmd>lua require("dapui").eval()<CR>')

-- Telescope
nnoremap('<leader>dv', '<Cmd>Telescope dap variables<CR>')
nnoremap('<leader>df', '<Cmd>Telescope dap frames<CR>')
