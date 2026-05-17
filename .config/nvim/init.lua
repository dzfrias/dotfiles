-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

vim.opt.wrap = false
vim.opt.background = "dark"
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.lazyredraw = true
vim.opt.clipboard:append("unnamedplus")

vim.opt.showmode = true
vim.opt.pumheight = 10
vim.opt.pumblend = 10

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 0
vim.opt.autoread = true
vim.opt.autowrite = false
vim.cmd([[set completeopt+=menuone,noselect,popup]])

local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.modeline = true
vim.opt.modelines = 1

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"

vim.g.mapleader = " "
vim.g.netrw_banner = 0
vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+]]
vim.g.netrw_localcopydircmd = "cp -r"
vim.g.copilot_no_tab_map = true

vim.g.dzfrias_fmt = true

vim.keymap.set("n", "gg", "gg0", { noremap = true })
vim.keymap.set("n", "-", function()
  local current_file = vim.fs.basename(vim.api.nvim_buf_get_name(0))
  vim.cmd("Explore")
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local target_line = 1
  for i, line in ipairs(lines) do
    if line == current_file then
      target_line = i
    end
  end
  -- Put cursor on the file we came from automatically
  vim.api.nvim_win_set_cursor(0, { target_line, 0 })
end, { noremap = true })
vim.keymap.set("n", "<CR>", "o<Esc>", { noremap = true })
vim.keymap.set("n", "<s-CR>", "O<Esc>", { noremap = true })
vim.keymap.set("n", "<leader>w", "<Cmd>write<CR>", { noremap = true })
vim.keymap.set("n", "<C-f>", "<C-^", { noremap = true })
vim.keymap.set("n", "<space><space>", "za", { noremap = true })
vim.keymap.set("n", "k", "gk", { noremap = true })
vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("i", "jk", "<Esc>", { noremap = true })
vim.keymap.set("i", "<CR>", function()
  local info = vim.fn.complete_info({ "pum_visible", "selected" })
  -- Auto select and complete if there's nothing selected
  if info.pum_visible == 1 and info.selected == -1 then
    return "<C-n><C-y>"
  elseif info.pum_visible == 1 then
    return "<C-y>"
  else
    -- Use the mini.pairs ENTER instead of the default
    return require("mini.pairs").cr()
  end
end, { expr = true, silent = true })
vim.keymap.set({ "n", "i", "v", "s" }, "<C-j>", function()
  if vim.snippet.active() then
    vim.snippet.jump(1)
  else
    return "<C-j>"
  end
end, { expr = true, silent = true })
vim.keymap.set({ "n", "i", "v", "s" }, "<C-k>", function()
  if vim.snippet.active() then
    vim.snippet.jump(-1)
  else
    return "<C-k>"
  end
end, { expr = true, silent = true })
vim.keymap.set("i", "<C-l>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})

-- Select up to the last character in the line (one character before $)
-- Useful in languages that have ; at EOL
vim.keymap.set({ "o", "x" }, "n", function()
  local line = vim.api.nvim_get_current_line()
  vim.cmd.normal({ vim.fn.mode() == "v" and "o" or "v", bang = true })
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  vim.api.nvim_win_set_cursor(0, { cursor_pos[1], #line - 2 })
end, {})

-- Remove the default gr LSP mappings
vim.keymap.del("n", "grt", {})
vim.keymap.del("n", "grr", {})
vim.keymap.del("n", "gra", {})
vim.keymap.del("n", "gri", {})
vim.keymap.del("n", "grn", {})

-- Better clipboard control
vim.keymap.set({ "n", "x" }, "c", '"_c', { noremap = true, silent = true })
vim.keymap.set({ "n", "x" }, "C", '"_C', { noremap = true, silent = true })
vim.keymap.set("n", "cc", '"_cc', { noremap = true, silent = true })
vim.keymap.set({ "n", "x" }, "s", '"_s', { noremap = true, silent = true })
vim.keymap.set({ "n", "x" }, "S", '"_S', { noremap = true, silent = true })
vim.keymap.set({ "n", "x" }, "d", '"_d', { noremap = true, silent = true })
vim.keymap.set("n", "dd", '"_dd', { noremap = true, silent = true })
vim.keymap.set({ "n", "x" }, "D", '"_D', { noremap = true, silent = true })
vim.keymap.set({ "n", "x" }, "x", '"_x', { noremap = true, silent = true })
vim.keymap.set({ "n", "x" }, "X", '"_X', { noremap = true, silent = true })
vim.keymap.set({ "x" }, "p", "P", { noremap = true, silent = true })

-- m as the "move" operator (delete and yank)
vim.keymap.set({ "n", "x" }, "m", "d", { noremap = true, silent = true })
vim.keymap.set("n", "mm", "dd", { noremap = true, silent = true })

vim.keymap.set("n", "<C-f>", "<C-^>", { noremap = true })
vim.keymap.set("n", "<C-p>", function()
  local file = vim.api.nvim_buf_get_name(0)
  if file:match("%.c$") then
    local h_file = file:sub(1, -3) .. ".h"
    vim.cmd.edit(h_file)
  elseif file:match("%.h$") then
    local c_file = file:sub(1, -3) .. ".c"
    vim.cmd.edit(c_file)
  end
end, { noremap = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("dzfrias_textyank", { clear = false }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim.api.nvim_create_autocmd("FileType", {
--   group = vim.api.nvim_create_augroup("dzfrias_netrw", { clear = false }),
--   pattern = "netrw",
--   callback = function()
--     vim.wo.number = true
--     vim.wo.relativenumber = true
--     local bufnr = vim.fn.bufnr()
--     -- q to go back to previous file
--     vim.keymap.set("n", "q", "<Cmd>Rexplore<CR>", { nowait = true, buffer = bufnr })
--   end,
-- })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    local opts = { noremap = true, buffer = args.buf }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", function()
      vim.lsp.buf.hover({ border = "rounded" })
    end, opts)
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>n", vim.lsp.buf.rename, opts)

    -- Diagnostics
    vim.keymap.set("n", "<leader>]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>e", function()
      vim.diagnostic.open_float({ border = "rounded" })
    end, opts)
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

    vim.api.nvim_create_user_command("LspStop", function()
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      for _, client in ipairs(clients) do
        client:stop()
      end
    end, {})
    vim.api.nvim_create_user_command("LspInfo", "checkhealth lsp", {})

    -- if client:supports_method("textDocument/completion") then
    --   local chars = {}
    --   for i = 32, 126 do
    --     local c = string.char(i)
    --     -- Exclude these specific characters from completion
    --     if c ~= " " and c ~= ":" and c ~= ";" and c ~= "," and c ~= "{" and c ~= "}" then
    --       table.insert(chars, c)
    --     end
    --   end
    --   client.server_capabilities.completionProvider.triggerCharacters = chars
    --   vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    -- end

    if client:supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("dzfrias_lspfmt", { clear = false }),
        buffer = args.buf,
        callback = function()
          if vim.g.dzfrias_fmt == false then
            return
          end
          vim.lsp.buf.format({
            bufnr = args.buf,
            id = client.id,
            timeout_ms = 1000,
          })
        end,
      })
    end
  end,
})

vim.diagnostic.enable(false, {})
-- Better LSP UI
-- vim.diagnostic.config({
--   virtual_text = { prefix = "●" },
--   signs = true,
--   underline = true,
--   update_in_insert = false,
--   severity_sort = true,
-- })
--
-- vim.diagnostic.config({
--   signs = {
--     text = {
--       [vim.diagnostic.severity.ERROR] = "✗",
--       [vim.diagnostic.severity.WARN] = "⚠",
--       [vim.diagnostic.severity.INFO] = "ℹ",
--       [vim.diagnostic.severity.HINT] = "💡",
--     },
--   },
-- })

vim.api.nvim_create_user_command("FormatStop", function()
  vim.g.dzfrias_fmt = false
end, {})

vim.api.nvim_create_user_command("FormatStart", function()
  vim.g.dzfrias_fmt = true
end, {})

vim.lsp.config["zls"] = {
  cmd = { "zls" },
  filetypes = { "zig" },
  root_markers = { "build.zig" },
}
vim.lsp.enable("zls")

vim.lsp.config["clangd"] = {
  cmd = { "clangd" },
  filetypes = { "c", "cpp" },
  root_markers = {
    ".clangd",
    "compile_commands.json",
    ".git",
    "compile_flags.txt",
  },
}
vim.lsp.enable("clangd")

vim.lsp.config["pyright"] = {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
}
vim.lsp.enable("pyright")

local function get_project_root()
  return vim.fn.fnamemodify(vim.fn.finddir(".git", ".;"), ":h:p")
end

-- Plugins
require("lazy").setup({
  spec = {
    {
      "dzfrias/arena.nvim",
      event = "BufWinEnter",
      opts = {
        ignore_current = true,
        devicons = true,
      },
      dev = true,
      keys = {
        {
          "<leader>f",
          function()
            require("arena").toggle()
          end,
        },
      },
    },

    {
      "dzfrias/noir.nvim",
      lazy = false,
      config = function()
        vim.cmd([[colorscheme noir]])
      end,
    },

    "tpope/vim-surround",
    "tpope/vim-repeat",
    "tpope/vim-sleuth",
    "matze/vim-move",
    { "nvim-tree/nvim-web-devicons", opts = {} },
    { "echasnovski/mini.comment", config = true },
    { "echasnovski/mini.pairs", event = "InsertEnter", config = true },
    -- "github/copilot.vim",

    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      cmd = "Telescope",
      opts = function()
        local actions = require("telescope.actions")
        return {
          defaults = {
            layout_strategy = "vertical",
            layout_config = {
              vertical = { width = 0.7 },
            },
            mappings = {
              i = {
                ["<C-u>"] = false,
                ["<Esc>"] = actions.close,
              },
            },
          },
        }
      end,
      keys = {
        {
          "<leader>tf",
          function()
            require("telescope.builtin").find_files({
              cwd = get_project_root(),
            })
          end,
        },
        {
          "<leader>tl",
          function()
            require("telescope.builtin").live_grep({
              cwd = get_project_root(),
            })
          end,
        },
        {
          "<leader>tr",
          function()
            require("telescope.builtin").lsp_references()
          end,
        },
      },
    },

    {
      "nvim-treesitter/nvim-treesitter",
      lazy = false,
      build = ":TSUpdate",
      opts = {
        highlight = {
          enable = true,
        },
      },
      config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
      end,
    },

    {
      "lewis6991/gitsigns.nvim",
      event = { "BufReadPre", "BufNewFile" },
      keys = {
        {
          "gp",
          function()
            require("gitsigns").preview_hunk()
          end,
        },
        {
          "gr",
          function()
            require("gitsigns").reset_hunk()
          end,
        },
        {
          "]g",
          function()
            require("gitsigns").next_hunk()
          end,
        },
        {
          "[g",
          function()
            require("gitsigns").prev_hunk()
          end,
        },
      },
      opts = { attach_to_untracked = false },
    },
  },

  dev = {
    path = "~/code",
  },
})
