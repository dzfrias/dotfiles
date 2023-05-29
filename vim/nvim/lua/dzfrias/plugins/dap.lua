return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      {
        'rcarriga/nvim-dap-ui',
        config = function(opts)
          require('dapui').setup(opts)
          local dapui = require 'dapui'
          local dap = require 'dap'
          dap.listeners.after.event_initialized['dapui_config'] = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated['dapui_config'] = function()
            dapui.close()
          end
          dap.listeners.before.event_exited['dapui_config'] = function()
            dapui.close()
          end
        end,
      },
      {
        'theHamsta/nvim-dap-virtual-text',
        config = true,
        dependencies = {
          'nvim-treesitter/nvim-treesitter',
        },
      },
      {
        'nvim-telescope/telescope-dap.nvim',
        config = function()
          require('telescope').load_extension 'dap'
        end,
        dependencies = {
          'nvim-treesitter/nvim-treesitter',
          'nvim-telescope/telescope.nvim',
        },
      },
    },
    keys = {
      -- Run
      {
        '<leader>dd',
        '<Cmd>lua require("dap").continue()<CR>',
        desc = 'Open debugger',
      },

      -- Quit
      {
        '<leader>dq',
        '<Cmd>lua require("dap").terminate()<CR>',
        desc = 'Quit debugger',
      },

      -- Continue to breakpoint or start debugging if no session is active
      {
        '<leader>dc',
        '<Cmd>lua require("dap").continue()<CR>',
        desc = 'Go to next breakpoint in debugger',
      },
      -- Continue backwards until breakpoint
      {
        '<leader>dC',
        '<Cmd>lua require("dap").reverse_continue()<CR>',
        desc = 'Go to previous breakpoint in debugger',
      },

      -- Breakpoints
      {
        '<leader>dt',
        '<Cmd>lua require("dap").toggle_breakpoint()<CR>',
        desc = 'Toggle breakpoint in debugger',
      },

      -- Movement and navigation
      {
        '<leader>dl',
        '<Cmd>lua require("dap").step_into()<CR>',
        desc = 'Step into stack frame in debugger',
      },
      {
        '<leader>dh',
        '<Cmd>lua require("dap").step_out()<CR>',
        desc = 'Step out of stack frame in debugger',
      },
      {
        '<leader>dj',
        '<Cmd>lua require("dap").step_over()<CR>',
        desc = 'Step in debugger',
      },
      {
        '<leader>dk',
        '<Cmd>lua require("dap").step_back()<CR>',
        desc = 'Step up in debugger',
      },

      -- Misc
      {
        '<leader>dz',
        '<Cmd>lua require("dap").run_to_cursor()<CR>',
        desc = 'Step until cursor in debugger',
      },
      {
        '<leader>di',
        '<Cmd>lua require("dapui").eval()<CR>',
        mode = { 'n', 'x' },
        desc = 'Evaluate expression in debugger',
      },

      -- Telescope
      {
        '<leader>dv',
        '<Cmd>Telescope dap variables<CR>',
        desc = 'Telescope variables in debugger',
      },
      {
        '<leader>df',
        '<Cmd>Telescope dap frames<CR>',
        desc = 'Telescope stack frames in debugger',
      },
    },
    config = function()
      vim.api.nvim_set_hl(0, 'Breakpoint', { fg = '#ff9e64' })
      vim.fn.sign_define(
        'DapBreakpoint',
        { text = '', texthl = 'Breakpoint', linehl = '', numhl = '' }
      )
      vim.fn.sign_define(
        'DapBreakpointCondition',
        { text = '', texthl = 'Breakpoint', linehl = '', numhl = '' }
      )
      vim.fn.sign_define(
        'DapLogPoint',
        { text = '', texthl = 'Breakpoint', linehl = '', numhl = '' }
      )
    end,
  },
}
