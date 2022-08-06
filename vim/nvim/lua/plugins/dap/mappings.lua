local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true })
end

-- Run configuration
map('n', '<leader>dd', '<Cmd>Telescope dap configurations<CR>')
-- Run configuration as if it is a go CLI app
map('n', '<leader>dg', '<Cmd>lua require("dap").run(require("plugins/dap/cli").add_args_go())<CR>')

-- Quit
map('n', '<leader>dq', '<Cmd>lua require("dap").terminate()<CR>')

-- Continue to breakpoint or start debugging if no session is active
map('n', '<leader>dc', '<Cmd>lua require("dap").continue()<CR>')
-- Continue backwards until breakpoint
map('n', '<leader>dC', '<Cmd>lua require("dap").reverse_continue()<CR>')

-- Breakpoints
map('n', '<leader>dt', '<Cmd>lua require("dap").toggle_breakpoint()<CR>')

-- Movement and navigation
map('n', '<leader>dl', '<Cmd>lua require("dap").step_into()<CR>')
map('n', '<leader>dh', '<Cmd>lua require("dap").step_out()<CR>')
map('n', '<leader>dj', '<Cmd>lua require("dap").step_over()<CR>')
map('n', '<leader>dk', '<Cmd>lua require("dap").step_back()<CR>')

-- Misc
map('n', '<leader>dz', '<Cmd>lua require("dap").run_to_cursor()<CR>')
map('n', '<leader>di', '<Cmd>lua require("dapui").eval()<CR>')
map('x', '<leader>di', '<Cmd>lua require("dapui").eval()<CR>')

-- Telescope
map('n', '<leader>dv', '<Cmd>Telescope dap variables<CR>')
map('n', '<leader>df', '<Cmd>Telescope dap frames<CR>')
