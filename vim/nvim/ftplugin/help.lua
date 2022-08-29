local bufnoremap = require('dzfrias/util').bufnoremap

bufnoremap('n', '<CR>', '<C-]>')
bufnoremap('n', '<BS>', '<C-T>')
bufnoremap('n', '<leader>t', '<Cmd>setlocal filetype=text<CR>')

local ts_utils = require 'nvim-treesitter.ts_utils'

local function get_child_by_type(node, type)
  for child in node:iter_children() do
    if child:type() == type then
      return child
    end
  end
  return nil
end

local function closest_tag_node()
  local cursor_node = ts_utils.get_node_at_cursor()
  if not cursor_node then
    return
  end
  if cursor_node:type() == 'help_file' then
    vim.cmd 'normal! w'
    cursor_node = ts_utils.get_node_at_cursor()
    if not cursor_node then
      return
    end
  end
  if cursor_node:type() == 'tag' then
    return cursor_node
  end
  local parent_line = cursor_node:parent()
  while parent_line:type() ~= 'line' do
    parent_line = parent_line:parent()
  end

  local prev_sibling = parent_line:prev_sibling()
  while get_child_by_type(prev_sibling, 'tag') == nil do
    prev_sibling = prev_sibling:prev_sibling()
  end

  return get_child_by_type(prev_sibling, 'tag')
end

local function open_closest_tag()
  local tag_node = closest_tag_node()
  if not tag_node then
    return
  end
  local tag_name =
    vim.treesitter.query.get_node_text(tag_node, 0):gsub('%*', '')

  local html_fname = vim.fn.expand '%:t:r' .. '.html'
  local url = 'https://neovim.io/doc/user/' .. html_fname .. '#' .. tag_name
  vim.fn.system('open -u "' .. url .. '"')
end

vim.api.nvim_buf_create_user_command(0, 'Open', open_closest_tag, {})
