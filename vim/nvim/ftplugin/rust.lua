vim.opt_local.colorcolumn = '80'
vim.opt_local.foldmethod = 'expr'
vim.opt_local.foldexpr = 'nvim_treesitter#foldexpr()'

local autopairs = {}
autopairs['('] = ')'
autopairs['['] = ']'
autopairs['{'] = '}'
autopairs['"'] = '"'
autopairs['`'] = '`'
autopairs['<'] = '>'
vim.b.AutoPairs = autopairs

local ts_utils = require 'nvim-treesitter.ts_utils'
local ts_locals = require 'nvim-treesitter.locals'

local obj_decls = {
  struct_item = true,
  enum_item = true,
}

local function get_obj_decl_node(scope)
  local obj_decl_node
  for _, node in ipairs(scope) do
    if obj_decls[node:type()] then
      obj_decl_node = node
      break
    end
  end

  return obj_decl_node
end

local function get_obj_decl_info(obj_decl_node)
  local parens_obj_decls = {}
  for _, obj_decl in ipairs(vim.tbl_keys(obj_decls)) do
    table.insert(parens_obj_decls, '(' .. obj_decl .. ')')
  end
  local obj_decls_alternation = '['
    .. table.concat(parens_obj_decls, ' ')
    .. ']'
  print(obj_decls_alternation .. ' type_parameters: (type_parameters) @capture')
  local type_params_query = vim.treesitter.parse_query(
    'rust',
    obj_decls_alternation .. ' type_parameters: (type_parameters) @capture'
  )
  local type_identifiers_query =
    vim.treesitter.parse_query('rust', obj_decls_alternation .. [[
        type_parameters: (type_parameters
                           (constrained_type_parameter
                             left: (type_identifier) @capture))
    ]])

  local type_constraint_node
  -- Get first node that matches the query, should only be one
  for _, node in type_params_query:iter_captures(obj_decl_node, 0) do
    type_constraint_node = node
    break
  end
  local type_constraints =
    vim.treesitter.query.get_node_text(type_constraint_node, 0)

  local type_identifiers = {}
  for _, node in type_identifiers_query:iter_captures(obj_decl_node, 0) do
    table.insert(type_identifiers, vim.treesitter.query.get_node_text(node, 0))
  end

  local parent = type_constraint_node:parent()
  local obj_name_node = parent:field('name')[1]
  local obj_name = vim.treesitter.query.get_node_text(obj_name_node, 0)

  return {
    constraints = type_constraints,
    name = obj_name,
    identifiers = type_identifiers,
  }
end

local function make_obj_impl()
  local cursor_node = ts_utils.get_node_at_cursor()
  local scope = ts_locals.get_scope_tree(cursor_node, 0)

  local obj_decl_node = get_obj_decl_node(scope)
  if not obj_decl_node then
    print 'No object declaration found in current scope'
    return
  end

  local obj_decl_info = get_obj_decl_info(obj_decl_node)
  local row = obj_decl_node:end_()
  row = row + 2

  local identifiers = table.concat(obj_decl_info.identifiers, ', ')
  vim.api.nvim_buf_set_lines(0, row, row, false, {
    'impl'
      .. obj_decl_info.constraints
      .. ' '
      .. obj_decl_info.name
      .. '<'
      .. identifiers
      .. '> {}',
    '',
  })
  vim.api.nvim_win_set_cursor(0, { row + 1, 0 })
end

vim.api.nvim_buf_create_user_command(0, 'Impl', make_obj_impl, {})
