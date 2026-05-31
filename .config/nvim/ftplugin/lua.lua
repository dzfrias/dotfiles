vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("dzfrias_stylua", { clear = true }),
  pattern = { "*.lua" },
  callback = function()
    require("fmt").format_buffer(
      0,
      { "stylua", "-", "--search-parent-directories" }
    )
  end,
})

vim.treesitter.start()
