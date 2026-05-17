vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("dzfrias_prettier_html", { clear = true }),
  pattern = { "*.html" },
  callback = function()
    require("fmt").format_buffer(0, { "prettier", "--parser", "html" })
  end,
})
