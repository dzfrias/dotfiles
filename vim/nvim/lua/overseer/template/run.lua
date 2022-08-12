local util = require 'dzfrias/util'

local go_parser = {
  -- Skip lines until we hit panic:
  { 'test', '^panic:' },
  -- Skip lines until we hit goroutine
  { 'skip_until', '^goroutine%s' },
  -- Repeat this parsing sequence
  {
    'loop',
    {
      'sequence',
      {
        'extract',
        { append = false },
        { '^(.+)%(.*%)$', '^created by (.+)$' },
        'text',
      },
      {
        'extract',
        '^%s+([^:]+.go):([0-9]+)',
        'filename',
        'lnum',
      },
    },
  },
}

local function select_parser(ft)
  if ft == 'go' then
    return go_parser
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
    return {
      name = 'run',
      cmd = util.run_cmds[ft],
      args = { main, task.args },

      components = {
        'default',
        { 'on_result_diagnostics_quickfix', open = true },
        { 'on_result_diagnostics', remove_on_restart = true },
        parser,
      },
    }
  end,
  params = {
    args = {
      type = 'string',
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
