local util = require 'dzfrias/util'

local function select_parser(ft)
  -- TODO: Finish automatic parser require
  local parsers =
    vim.fn.split(vim.fn.globpath('overseer/template/parsers', '*'), '\n')
  for _, parser in ipairs(parsers) do
    print(parser)
  end
  if ft == 'go' then
    return require 'overseer/template/parsers/go'
  elseif ft == 'python' then
    return require 'overseer/template/parsers/python'
  elseif ft == 'zsh' then
    return require 'overseer/template/parsers/zsh'
  end
  return nil
end

local function wrap_parser(parser)
  return {
    'on_output_parse',
    parser = {
      diagnostics = parser,
    },
  }
end

return {
  name = 'run',
  builder = function(task)
    local ft = vim.o.filetype
    local parser = select_parser(ft)
    if parser then
      parser = wrap_parser(parser)
    end
    local name = 'run (<noargs>)'
    if #task.args > 0 then
      name = 'run (' .. table.concat(task.args, ' ') .. ')'
    end
    return {
      name = name,
      cmd = util.run_cmds[ft],
      args = { '${proj_main}', unpack(task.args) },

      components = {
        'default',
        'unique',
        'open_float',
        'on_result_diagnostics_quickfix',
        'interpolate_args',
        parser,
      },
    }
  end,

  params = {
    args = {
      type = 'list',
      subtype = {
        type = 'string',
      },
      delimiter = ' ',
      name = 'Arguments',
      description = 'Arguments for the command',
    },
  },
  condition = {
    callback = function()
      return util.main_supported(vim.o.filetype)
    end,
  },
}
