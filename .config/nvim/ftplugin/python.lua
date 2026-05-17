vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("dzfrias_black", { clear = true }),
  pattern = { "*.py" },
  callback = function()
    require("fmt").format_buffer(0, { "black", "-", "--quiet" })
  end,
})
