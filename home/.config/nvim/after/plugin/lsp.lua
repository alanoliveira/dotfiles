require("lua-dev").setup({}) -- IMPORTANT: make sure to setup lua-dev BEFORE lspconfig
require("nvim-lsp-installer").setup({ ensure_installed = { "sumneko_lua" } })
require "lsp_signature".setup({ floating_window = false, hint_prefix = "" })
require("lsp-format").setup({})
local lspcfg = require("lspconfig")

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
local has_eslintrc = function(utils)
  return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.yaml", ".eslintrc.yml", ".eslintrc.json" })
end

null_ls.setup({
  on_attach = require("alan.lsp_handlers").on_attach,
  capabilities = require("alan.lsp_handlers").capabilities,
  sources = {
    null_ls.builtins.code_actions.eslint_d.with({ condition = has_eslintrc }),
    null_ls.builtins.formatting.eslint_d.with({ condition = has_eslintrc }),
    null_ls.builtins.diagnostics.eslint_d.with({ condition = has_eslintrc }),
    null_ls.builtins.formatting.prettier.with({ condition = function(utils) return not has_eslintrc(utils) end }),
  },
})