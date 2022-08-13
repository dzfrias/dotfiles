local util = require 'dzfrias/util'

local function select_parser(ft)
  if ft == 'go' then
    return require 'overseer/template/parsers/go'
  elseif ft == 'python' then
    return require 'overseer/template/parsers/python'
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
    local main = util.get_main(ft)
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
      args = { main, unpack(task.args) },

      components = {
        'default',
        'unique',
        'on_result_diagnostics_quickfix',
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
