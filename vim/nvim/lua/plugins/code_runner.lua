require('code_runner').setup {
  -- put here the commands by filetype
  filetype = {
    python = 'python3 -u',
    rust = 'cd $dir && rustc $fileName && $dir/$fileNameWithoutExt'
  },
  float = {
    border = 'rounded'
  }
}
