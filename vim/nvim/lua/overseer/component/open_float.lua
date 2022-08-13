return {
  desc = [[
  Open task output in a floating window after completion.
  If the quickfix is not empty, open that with Trouble
  ]],
  editable = false,
  serializable = true,
  constructor = function()
    return {
      on_complete = function(_, task)
        if not task then
          return
        end
        require('overseer').run_action(task, 'open float')
        require('dzfrias/util').bufnoremap('n', 'q', '<Cmd>quit<CR>')

        if not task:has_component 'on_result_diagnostics_quickfix' then
          return
        end
        -- Open Trouble if quickfix is not empty
        vim.api.nvim_create_autocmd('BufLeave', {
          group = vim.api.nvim_create_augroup(
            'overseer_leave',
            { clear = true }
          ),
          callback = function()
            if #vim.fn.getqflist() > 0 then
              vim.cmd [[
              Trouble quickfix
              normal! G
              ]]
            end
          end,
          buffer = 0,
        })
      end,
    }
  end,
}
