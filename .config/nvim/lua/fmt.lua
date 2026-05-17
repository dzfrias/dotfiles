local M = {}

-- Taken from stevearc/conform.nvim
local function tbl_slice(tbl, start_idx, end_idx)
  local ret = {}
  if not start_idx then
    start_idx = 1
  end
  if not end_idx then
    end_idx = #tbl
  end
  for i = start_idx, end_idx do
    table.insert(ret, tbl[i])
  end
  return ret
end

-- Taken from stevearc/conform.nvim
local function common_prefix_len(a, b)
  if not a or not b then
    return 0
  end
  local min_len = math.min(#a, #b)
  for i = 1, min_len do
    if string.byte(a, i) ~= string.byte(b, i) then
      return i - 1
    end
  end
  return min_len
end

-- Taken from stevearc/conform.nvim
local function common_suffix_len(a, b)
  local a_len = #a
  local b_len = #b
  local min_len = math.min(a_len, b_len)
  for i = 0, min_len - 1 do
    if string.byte(a, a_len - i) ~= string.byte(b, b_len - i) then
      return i
    end
  end
  return min_len
end

-- Taken from stevarc/conform.nvim
local function create_text_edit(
  original_lines,
  replacement,
  is_insert,
  is_replace,
  orig_line_start,
  orig_line_end,
  line_ending
)
  local start_line, end_line = orig_line_start - 1, orig_line_end - 1
  local start_char, end_char = 0, 0
  if is_replace then
    -- If we're replacing text, see if we can avoid replacing the entire line
    start_char = common_prefix_len(original_lines[orig_line_start], replacement[1])
    if start_char > 0 then
      replacement[1] = replacement[1]:sub(start_char + 1)
    end

    if original_lines[orig_line_end] then
      local last_line = replacement[#replacement]
      local suffix = common_suffix_len(original_lines[orig_line_end], last_line)
      -- If we're only replacing one line, make sure the prefix/suffix calculations don't overlap
      if orig_line_end == orig_line_start then
        suffix = math.min(suffix, original_lines[orig_line_end]:len() - start_char)
      end
      end_char = original_lines[orig_line_end]:len() - suffix
      if suffix > 0 then
        replacement[#replacement] = last_line:sub(1, last_line:len() - suffix)
      end
    end
  end
  -- If we're inserting text, make sure the text includes a newline at the end.
  -- The one exception is if we're inserting at the end of the file, in which case the newline is
  -- implicit
  if is_insert and start_line < #original_lines then
    table.insert(replacement, "")
  end
  local new_text = table.concat(replacement, line_ending)

  return {
    newText = new_text,
    range = {
      start = {
        line = start_line,
        character = start_char,
      },
      ["end"] = {
        line = end_line,
        character = end_char,
      },
    },
  }
end

function M.format_buffer(bufnr, cmd)
  if vim.g.dzfrias_fmt == false then
    return
  end

  if bufnr == 0 then
    bufnr = vim.api.nvim_get_current_buf()
  end

  local original_lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local contents = table.concat(original_lines, "\n")
  local sys_cmd = vim.system(
    cmd,
    {
      stdin = contents,
      text = true,
    },
    vim.schedule_wrap(function(result)
      if result.code ~= 0 then
        return
      end

      -- Add extra newline if necessary
      if vim.bo[bufnr].eol then
        table.insert(original_lines, "")
        contents = contents .. "\n"
      end

      local new_lines = vim.split(result.stdout, "\n", { plain = true })
      local diff = vim.diff(contents, result.stdout, { result_type = "indices", algorithm = "histogram" })
      if #diff == 0 then
        return
      end

      -- Diff logic taken from stevarc/conform.nvim
      local text_edits = {}
      for _, idx in ipairs(diff) do
        local orig_line_start, orig_line_count, new_line_start, new_line_count = unpack(idx)
        local is_insert = orig_line_count == 0
        local is_delete = new_line_count == 0
        local is_replace = not is_insert and not is_delete
        local orig_line_end = orig_line_start + orig_line_count
        local new_line_end = new_line_start + new_line_count

        if is_insert then
          -- When the diff is an insert, it actually means to insert after the mentioned line
          orig_line_start = orig_line_start + 1
          orig_line_end = orig_line_end + 1
        end

        local replacement = tbl_slice(new_lines, new_line_start, new_line_end - 1)

        -- For replacement edits, convert the end line to be inclusive
        if is_replace then
          orig_line_end = orig_line_end - 1
        end
        local should_apply_diff = not only_apply_range
          or not range
          or indices_in_range(range, orig_line_start, orig_line_end)
        if should_apply_diff then
          local text_edit =
            create_text_edit(original_lines, replacement, is_insert, is_replace, orig_line_start, orig_line_end, "\n")
          table.insert(text_edits, text_edit)

          -- If we're using the aftermarket range formatting, diffs often have paired delete/insert
          -- diffs. We should make sure that if one of them overlaps our selected range, extend the
          -- range so that we pick up the other diff as well.
          if range and only_apply_range then
            range = vim.deepcopy(range)
            range["end"][1] = math.max(range["end"][1], orig_line_end + 1)
          end
        end
      end

      vim.lsp.util.apply_text_edits(text_edits, bufnr, "utf-8")
    end)
  )
end

return M
