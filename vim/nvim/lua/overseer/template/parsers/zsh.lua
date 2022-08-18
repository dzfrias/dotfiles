-- Note that this is a pretty general regular expression, but this is about
-- as much as zsh gives us
local ERR_REGEX = '^.+:%d+: .+$'

return {
  { 'test', ERR_REGEX },
  {
    'skip_until',
    { skip_matching_line = false },
    ERR_REGEX,
  },
  {
    'extract',
    {
      postprocess = function(extracted)
        -- Fix error offset with some scenarios
        if extracted.lnum > vim.fn.line '$' then
          extracted.lnum = extracted.lnum - 1
        end
      end,
    },
    -- Extract filename, line number, and text
    '^(.+):(%d+): (.+)$',
    'filename',
    'lnum',
    'text',
  },
}
