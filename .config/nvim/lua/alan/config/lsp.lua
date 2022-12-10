require("mason").setup({})
require("mason-lspconfig").setup({ ensure_installed = { "sumneko_lua" } })
require "lsp_signature".setup({ floating_window = false, hint_prefix = "" })
require("lsp_lines").setup()
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

lspcfg.sumneko_lua.setup {
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
        },
      },
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

local null_ls = require("null-ls")
null_ls.setup({
  on_attach = require("alan.lsp_handlers").on_attach,
  capabilities = require("alan.lsp_handlers").capabilities,
})
