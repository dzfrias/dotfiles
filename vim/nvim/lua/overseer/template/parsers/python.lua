return {
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
