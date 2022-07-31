require'nvim-treesitter.configs'.setup {
  ensure_installed = { "python", "vim", "go", "lua", "json" },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gn",
      node_incremental = "gn",
      scope_incremental = "gs",
      node_decremental = "gN",
    },
  },
}
