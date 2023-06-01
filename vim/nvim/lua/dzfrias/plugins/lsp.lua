return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      -- Remove semantic token highlighting for parameters
      vim.api.nvim_set_hl(0, '@lsp.type.parameter', {})
      -- Remove special highlighting for builtin methods and functions in Rust
      vim.api.nvim_set_hl(0, '@lsp.typemod.method.defaultLibrary.rust', {})
      vim.api.nvim_set_hl(0, '@lsp.typemod.function.defaultLibrary.rust', {})

      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)

      -- Key bindings
      local on_attach = function(_, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', '<s-k>', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', '<leader>n', vim.lsp.buf.rename, bufopts)
        vim.keymap.set(
          { 'n', 'v' },
          '<leader>a',
          vim.lsp.buf.code_action,
          bufopts
        )
      end

      -- Format on save
      local format = vim.api.nvim_create_augroup('format', {})
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = format,
        pattern = '*',
        command = 'lua vim.lsp.buf.format { async = true }',
      })

      -- Setup lspconfig capabilities
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Setting up servers
      local lspconfig = require 'lspconfig'
      local default_install = { 'gopls', 'cssls', 'svelte', 'tsserver' }
      for _, lsp in ipairs(default_install) do
        lspconfig[lsp].setup {
          on_attach = on_attach,
          capabilities = capabilities,
        }
      end

      lspconfig.yamlls.setup {
        settings = {
          yaml = {
            schemas = {
              ['https://json.schemastore.org/github-workflow.json'] = '/.github/workflows/*',
            },
          },
        },
      }

      lspconfig.lua_ls.setup {
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
          -- Do not format code
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },
            diagnostics = {
              globals = { 'vim', 'hs' },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file('', true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
      }

      lspconfig.omnisharp.setup {
        cmd = {
          'mono',
          '--assembly-loader=strict',
          '/Users/dzfrias/.dotfiles/downloads/omnisharp-osx/omnisharp/OmniSharp.exe',
        },
        on_attach = on_attach,
        use_mono = true,
      }

      local configs = require 'lspconfig.configs'
      configs.ast_grep = {
        default_config = {
          cmd = { 'sg', 'lsp' },
          filetypes = { 'cs' },
          single_file_support = true,
          root_dir = require('lspconfig.util').root_pattern(
            '.git',
            'sgconfig.yml'
          ),
        },
      }

      lspconfig.ast_grep.setup {}
    end,
  },

  -- Generic language server
  {
    'jose-elias-alvarez/null-ls.nvim',
    opts = function()
      local null_ls = require 'null-ls'
      return {
        sources = {
          -- Use black python formatter
          null_ls.builtins.formatting.black,
          -- Basic zsh linting
          null_ls.builtins.diagnostics.zsh,
          -- Lua autoformatting
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.diagnostics.shellcheck,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.diagnostics.mypy,
        },
      }
    end,
  },

  -- LSP installer
  {
    'williamboman/mason.nvim',
    dependencies = { 'williamboman/mason-lspconfig.nvim', config = true },
    build = ':MasonUpdate',
    config = true,
  },
}
