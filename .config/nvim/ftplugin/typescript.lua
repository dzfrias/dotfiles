vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("dzfrias_prettier_typescript", { clear = true }),
  pattern = { "*.ts", "*.tsx" },
  callback = function()
    require("fmt").format_buffer(0, { "prettier", "--parser", "typescript", "--prose-wrap", "always" })
  end,
})
