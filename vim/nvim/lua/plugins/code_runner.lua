require('code_runner').setup {
  -- put here the commands by filetype
  filetype = {
    python = 'python3 -u',
    rust = 'cargo run',
    zsh = 'zsh $file',
    scpt = 'osascript $file',
    cpp = 'g+ $file',
    javascript = 'node $file',
    swift = 'swift $file',
    markdown = 'glow $file'
  },
  float = {
    border = 'rounded'
  }
}
