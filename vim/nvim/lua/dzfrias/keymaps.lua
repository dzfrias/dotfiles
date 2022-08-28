local util = require 'dzfrias/util'
-- Set up map functions
local nnoremap = util.nnoremap
local inoremap = util.inoremap
local noremap = util.noremap
local xnoremap = util.xnoremap

-- Go to top of file and first character
noremap('gg', 'gg0')

-- Fold movement
nnoremap('zk', '<Plug>FoldJumpUp')

noremap('<space><space>', 'za')

-- Go to last place in insert mode
noremap('gi', 'gi<Esc>')

-- Better wrapped line movement
noremap('k', 'gk')
noremap('j', 'gj')

-- Make a newline
nnoremap('<CR>', 'o<Esc>')
nnoremap('<s-CR>', 'O<Esc>')

-- Basic command mappings
nnoremap('<leader>w', '<Cmd>write<CR>')
nnoremap('<leader>s', '<Cmd>source %<CR>')
nnoremap('<leader>q', '<Cmd>quit!<CR>')
nnoremap('<leader>e', '<Cmd>edit<CR>')

-- Telescope
local tel = require 'telescope.builtin'
nnoremap('<leader>tf', function()
  tel.find_files { cwd = util.get_project_root() }
end)
nnoremap('<leader>tl', function()
  tel.live_grep { cwd = util.get_project_root() }
end)
nnoremap('<leader>tt', tel.lsp_document_symbols)
nnoremap('<leader>tr', tel.lsp_references)
nnoremap('<leader>tk', tel.keymaps)

-- Trouble
nnoremap('<leader>x', require('trouble').toggle)

-- Git mappings
nnoremap('gq', '<Cmd>Git<CR>')
nnoremap('gcm', function()
  vim.cmd [[
  write
  Git add --all
  Git commit --verbose
  ]]
end)
nnoremap('gp', '<Cmd>Git push<CR>')
-- Hunk mappings
local gs = require 'gitsigns'
nnoremap('gh', gs.preview_hunk)
nnoremap('gr', gs.reset_hunk)
nnoremap('gD', function()
  gs.setqflist 'all'
end)

-- Leap
nnoremap('gs', '<Plug>(leap-forward)')
nnoremap('gS', '<Plug>(leap-backward)')
xnoremap('gs', '<Plug>(leap-forward)')
xnoremap('gS', '<Plug>(leap-backward)')

-- Neotest
local neotest = require 'neotest'
nnoremap('<leader>uu', function()
  neotest.run.run(vim.fn.expand '%')
end)
nnoremap('<leader>ua', function()
  neotest.run.run(util.get_project_root())
end)
nnoremap('<leader>uo', function()
  neotest.output.open()
end)
nnoremap('<leader>us', function()
  neotest.summary.toggle()
  vim.cmd 'wincmd l'
end)

-- Overseer
local overseer = require 'overseer'

-- Basic commands
nnoremap('<leader>O', overseer.run_template)
nnoremap('<leader>o', overseer.toggle)

-- Pick a task to re-run with telescope
nnoremap('<leader>p', function()
  local pickers = require 'telescope.pickers'
  local finders = require 'telescope.finders'
  local conf = require('telescope.config').values
  local actions = require 'telescope.actions'
  local action_state = require 'telescope.actions.state'
  local tasks = {}
  for _, task in ipairs(require('overseer.task_list').list_tasks()) do
    table.insert(tasks, { task.name, task })
  end

  pickers
    .new({}, {
      prompt_title = 'Choose a task to re-run',
      finder = finders.new_table {
        results = tasks,
        entry_maker = function(task)
          return {
            value = task,
            display = task[1],
            ordinal = task[1],
          }
        end,
      },
      sorter = conf.generic_sorter {},
      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry().value[2]
          if selection then
            selection:restart()
          end
        end)
        return true
      end,
    })
    :find()
end)

-- Run commands
nnoremap('<leader>R', function()
  overseer.run_template { name = 'run' }
end)
nnoremap('<leader>r', function()
  overseer.run_template { name = 'run', params = { args = {} } }
end)

-- Escape
inoremap('jk', '<Esc>')
