return {
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
