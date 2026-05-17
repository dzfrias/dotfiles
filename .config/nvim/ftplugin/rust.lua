vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("dzfrias_rustfmt", { clear = true }),
  pattern = { "*.rs" },
  callback = function()
    require("fmt").format_buffer(0, { "rustfmt", "--edition", "2024" })
  end,
})
