vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("dzfrias_gofmt", { clear = true }),
  pattern = { "*.go" },
  callback = function()
    require("fmt").format_buffer(0, { "gofmt" })
  end,
})
