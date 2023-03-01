--LSP
return {
  "neovim/nvim-lspconfig", -- lsp quick configs
  dependencies = {
    { "jose-elias-alvarez/null-ls.nvim" }, -- generic language server
    { "onsails/lspkind.nvim" }, -- icons for lsp
    { "Maan2003/lsp_lines.nvim", config = true }, -- diagnostics as virtual lines
    { "williamboman/mason-lspconfig.nvim" }, -- lsp default configs
    { "folke/neodev.nvim", config = true }, -- makes lsp works with native nvim functions
    { "j-hui/fidget.nvim" }, -- show lsp loading status
  },
  config = function()
    require("fidget").setup({
      text = { spinner = "dots" },
      fmt = { task = false },
      timer = { fidget_decay = 2000, task_decay = 500 },
    })
    require("mason-lspconfig").setup({ ensure_installed = { "lua_ls" } })
    require("lsp_signature").setup({ floating_window = false, hint_prefix = "" })

    local lspcfg = require("lspconfig")

    vim.fn.sign_define("DiagnosticSignError", { texthl = "DiagnosticSignError", text = "", numhl = "" })
    vim.fn.sign_define("DiagnosticSignWarn", { texthl = "DiagnosticSignWarn", text = "", numhl = "" })
    vim.fn.sign_define("DiagnosticSignHint", { texthl = "DiagnosticSignHint", text = "", numhl = "" })
    vim.fn.sign_define("DiagnosticSignInfo", { texthl = "DiagnosticSignInfo", text = "", numhl = "" })

    vim.diagnostic.config({
      virtual_text = not require("alan.lsp_handlers").virtual_lines_enabled,
      virtual_lines = require("alan.lsp_handlers").virtual_lines_enabled,
    })

    lspcfg.solargraph.setup {
      on_attach = require("alan.lsp_handlers").on_attach,
      capabilities = require("alan.lsp_handlers").capabilities,
    }

    lspcfg.zls.setup {
      on_attach = require("alan.lsp_handlers").on_attach,
      capabilities = require("alan.lsp_handlers").capabilities,
    }

    lspcfg.gopls.setup {
      on_attach = require("alan.lsp_handlers").on_attach,
      capabilities = require("alan.lsp_handlers").capabilities,
    }

    lspcfg.rust_analyzer.setup {
      on_attach = require("alan.lsp_handlers").on_attach,
      capabilities = require("alan.lsp_handlers").capabilities,
      settings = {
        ["rust-analyzer"] = {
          allTargets = true,
        },
      },
    }

    lspcfg.lua_ls.setup {
      on_attach = require("alan.lsp_handlers").on_attach,
      capabilities = require("alan.lsp_handlers").capabilities,
      settings = {
        Lua = {
          format = {
            enable = true,
            defaultConfig = {
              quote_style = "double",
              table_separator_style = "comma",
              trailing_table_separator = "smart",
              align_array_table = "false",
            },
          },
        },
      },
    }

    lspcfg.clangd.setup {
      on_attach = require("alan.lsp_handlers").on_attach,
      capabilities = require("alan.lsp_handlers").capabilities,
    }

    local null_ls = require("null-ls")
    null_ls.setup({
      on_attach = require("alan.lsp_handlers").on_attach,
      capabilities = require("alan.lsp_handlers").capabilities,
    })
  end,
}
