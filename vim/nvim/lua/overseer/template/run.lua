local util = require 'dzfrias/util'

local go_parser = {
  -- Do not parse anything unless a panic line exists
  { 'test', '^panic:' },
  -- Skip until we hit a line matching this pattern
  { 'skip_until', '^goroutine%s' },
  {
    'loop',
    {
      'sequence',
      {
        'extract',
        { append = false },
        -- Extract info in stack trace
        { '^(.+)%(.*%)$', '^created by (.+)$' },
        'text',
      },
      {
        'extract',
        -- Get filename and line number from next line
        '^%s+([^:]+.go):([0-9]+)',
        'filename',
        'lnum',
      },
    },
  },
}

local python_parser = {
  -- Do not parse until this line is found
  { 'test', '^Traceback %(most recent call last%):$' },
  { 'skip_until', '^Traceback %(most recent call last%):$' },
  {
    'loop',
    {
      'sequence',
      {
        'extract',
        { append = false },
        -- Extract filename and line number
        '^  File "(.+)", line ([0-9]+), in .+$',
        'filename',
        'lnum',
      },
      {
        'extract',
        -- Extract text of traceback
        '^    (.+)$',
        'text',
      },
    },
  },
}

local function select_parser(ft)
  if ft == 'go' then
    return go_parser
  elseif ft == 'python' then
    return python_parser
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
