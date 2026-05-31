vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("dzfrias_prettier", { clear = true }),
  pattern = { "*.md" },
  callback = function()
    require("fmt").format_buffer(
      0,
      { "prettier", "--parser", "markdown", "--prose-wrap", "always" }
    )
  end,
})

vim.treesitter.start()
